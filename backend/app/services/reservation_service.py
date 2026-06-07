"""Service layer for reservation logic, including seat availability checks."""

from datetime import datetime
from sqlalchemy.orm import Session
from ..api.models import Flight, Reservation, Passenger
from ..api.schemas import ReservationCreate

class ReservationService:
    def __init__(self, db: Session):
        self.db = db

    def create_reservation(self, data: ReservationCreate):
        flight = self.db.query(Flight).filter(Flight.id == data.flight_id).first()
        if not flight:
            raise ValueError("Flight not found")
        if flight.seats_available <= 0:
            raise ValueError("No seats available")

        passenger = self.db.query(Passenger).filter(Passenger.id == data.passenger_id).first()
        if not passenger:
            raise ValueError("Passenger not found")

        reservation = Reservation(
            flight_id=data.flight_id,
            passenger_id=data.passenger_id,
            seat_number=data.seat_number,
            confirmed=False,
            created_at=datetime.utcnow(),
        )
        self.db.add(reservation)
        flight.seats_available -= 1
        self.db.commit()
        self.db.refresh(reservation)
        return reservation
