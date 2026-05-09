import pytest
from app.main import app
from fastapi.testclient import TestClient

client = TestClient(app)

def test_get_flights():
    response = client.get("/api/flights")
    assert response.status_code == 200
    assert isinstance(response.json(), list)
