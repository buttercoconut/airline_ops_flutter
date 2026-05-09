# Dummy reservation service
from typing import List
from ..api.schemas import Flight

class ReservationService:
    def reserve_flight(self, flight_id: int) -> bool:
        return True
