import pytest
from app import app

def test_app_exists():
    """Test that the Flask app exists"""
    assert app is not None

def test_health_endpoint():
    """Test the health check endpoint"""
    client = app.test_client()
    response = client.get('/health')
    assert response.status_code == 200
    data = response.get_json()
    assert data['status'] == 'healthy'

def test_home_page():
    """Test that home page loads"""
    client = app.test_client()
    response = client.get('/')
    assert response.status_code == 200

def test_api_exercises():
    """Test API exercises endpoint"""
    client = app.test_client()
    response = client.get('/api/exercises')
    assert response.status_code == 200
    data = response.get_json()
    assert isinstance(data, list)