# Dummy scheduling service
from typing import List
from ..api.schemas import Flight

class SchedulingService:
    def get_flights(self) -> List[Flight]:
        return []
