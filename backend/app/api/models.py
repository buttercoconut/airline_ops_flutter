"""SQLAlchemy models for core entities."""

from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, Boolean
from sqlalchemy.orm import relationship
from . import Base

class Flight(Base):
    __tablename__ = "flights"
    id = Column(Integer, primary_key=True, index=True)
    flight_number = Column(String, unique=True, index=True)
    origin = Column(String)
    destination = Column(String)
    departure_time = Column(DateTime)
    arrival_time = Column(DateTime)
    aircraft_type = Column(String)
    seats_total = Column(Integer)
    seats_available = Column(Integer)
    is_active = Column(Boolean, default=True)

    schedules = relationship("Schedule", back_populates="flight")

class Schedule(Base):
    __tablename__ = "schedules"
    id = Column(Integer, primary_key=True, index=True)
    flight_id = Column(Integer, ForeignKey("flights.id"))
    scheduled_departure = Column(DateTime)
    scheduled_arrival = Column(DateTime)
    flight = relationship("Flight", back_populates="schedules")

class Passenger(Base):
    __tablename__ = "passengers"
    id = Column(Integer, primary_key=True, index=True)
    first_name = Column(String)
    last_name = Column(String)
    email = Column(String, unique=True, index=True)
    phone = Column(String)

class Reservation(Base):
    __tablename__ = "reservations"
    id = Column(Integer, primary_key=True, index=True)
    flight_id = Column(Integer, ForeignKey("flights.id"))
    passenger_id = Column(Integer, ForeignKey("passengers.id"))
    seat_number = Column(String)
    confirmed = Column(Boolean, default=False)
    created_at = Column(DateTime)

    flight = relationship("Flight")
    passenger = relationship("Passenger")
