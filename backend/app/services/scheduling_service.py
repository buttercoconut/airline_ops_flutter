"""Service layer for scheduling logic."""

from datetime import datetime
from sqlalchemy.orm import Session
from ..api.models import Flight, Schedule

class SchedulingService:
    def __init__(self, db: Session):
        self.db = db

    def create_schedule(self, flight_id: int, departure: datetime, arrival: datetime):
        schedule = Schedule(
            flight_id=flight_id,
            scheduled_departure=departure,
            scheduled_arrival=arrival,
        )
        self.db.add(schedule)
        self.db.commit()
        self.db.refresh(schedule)
        return schedule

    def get_upcoming_flights(self, limit: int = 10):
        now = datetime.utcnow()
        return (
            self.db.query(Flight)
            .join(Schedule)
            .filter(Schedule.scheduled_departure >= now)
            .order_by(Schedule.scheduled_departure)
            .limit(limit)
            .all()
        )
