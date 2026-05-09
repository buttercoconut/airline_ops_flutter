from fastapi import APIRouter
from . import schemas, models

router = APIRouter()

@router.get("/flights", response_model=list[schemas.Flight])
async def get_flights():
    # Dummy data
    return [schemas.Flight(id=1, flight_number="AA101", origin="JFK", destination="LAX", departure_time="2024-05-10T08:00:00Z", arrival_time="2024-05-10T11:00:00Z")]
