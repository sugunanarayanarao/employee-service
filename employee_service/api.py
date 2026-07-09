from fastapi import APIRouter
from .models import Employee

router = APIRouter()

@router.get("/employees", response_model=list[Employee])
def get_employees():

    return [
        Employee(id=1, name="John", department="IT"),
        Employee(id=2, name="Alice", department="HR"),
        Employee(id=3, name="Bob", department="Finance"),
    ]
