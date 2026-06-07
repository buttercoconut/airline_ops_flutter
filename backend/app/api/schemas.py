"""Pydantic schemas for request/response validation."""

from datetime import datetime
from typing import Optional
from pydantic import BaseModel, EmailStr

class FlightBase(BaseModel):
    flight_number: str
    origin: str
    destination: str
    departure_time: datetime
    arrival_time: datetime
    aircraft_type: str
    seats_total: int
    seats_available: int

class FlightCreate(FlightBase):
    pass

class FlightOut(FlightBase):
    id: int
    is_active: bool

    class Config:
        orm_mode = True

class ReservationBase(BaseModel):
    flight_id: int
    passenger_id: int
    seat_number: str

class ReservationCreate(ReservationBase):
    pass

class ReservationOut(ReservationBase):
    id: int
    confirmed: bool
    created_at: datetime

    class Config:
        orm_mode = True
