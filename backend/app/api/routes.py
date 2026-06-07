"""API router with endpoints for flights and reservations."""

from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from ..config import settings
from ..api.schemas import FlightCreate, FlightOut, ReservationCreate, ReservationOut
from ..api.models import Flight, Reservation
from ..services.scheduling_service import SchedulingService
from ..services.reservation_service import ReservationService
from .. import get_db

router = APIRouter()

# Dependency to get DB session

def get_db():
    from sqlalchemy import create_engine
    from sqlalchemy.orm import sessionmaker
    engine = create_engine(settings.DATABASE_URL, pool_pre_ping=True)
    SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Flight endpoints
@router.post("/flights", response_model=FlightOut, status_code=status.HTTP_201_CREATED)
async def create_flight(flight: FlightCreate, db: Session = Depends(get_db)):
    db_flight = Flight(**flight.dict())
    db.add(db_flight)
    db.commit()
    db.refresh(db_flight)
    return db_flight

@router.get("/flights", response_model=list[FlightOut])
async def list_flights(db: Session = Depends(get_db)):
    return db.query(Flight).all()

# Reservation endpoints
@router.post("/reservations", response_model=ReservationOut, status_code=status.HTTP_201_CREATED)
async def create_reservation(res: ReservationCreate, db: Session = Depends(get_db)):
    service = ReservationService(db)
    reservation = service.create_reservation(res)
    return reservation

@router.get("/reservations/{reservation_id}", response_model=ReservationOut)
async def get_reservation(reservation_id: int, db: Session = Depends(get_db)):
    reservation = db.query(Reservation).filter(Reservation.id == reservation_id).first()
    if not reservation:
        raise HTTPException(status_code=404, detail="Reservation not found")
    return reservation
