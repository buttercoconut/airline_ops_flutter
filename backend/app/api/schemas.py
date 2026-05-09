from pydantic import BaseModel
from datetime import datetime

class Flight(BaseModel):
    id: int
    flight_number: str
    origin: str
    destination: str
    departure_time: datetime
    arrival_time: datetime
