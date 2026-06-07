"""Unit tests for the API endpoints."""

import pytest
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

@pytest.fixture
def create_flight():
    payload = {
        "flight_number": "AB123",
        "origin": "JFK",
        "destination": "LAX",
        "departure_time": "2025-01-01T08:00:00Z",
        "arrival_time": "2025-01-01T11:00:00Z",
        "aircraft_type": "Boeing 737",
        "seats_total": 180,
        "seats_available": 180,
    }
    response = client.post("/api/flights", json=payload)
    assert response.status_code == 201
    return response.json()

def test_create_and_get_flight(create_flight):
    flight_id = create_flight["id"]
    response = client.get(f"/api/flights")
    assert response.status_code == 200
    flights = response.json()
    assert any(f["id"] == flight_id for f in flights)
