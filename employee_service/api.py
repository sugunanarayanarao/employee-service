import os
from fastapi import APIRouter
from typing import List
from .models import Employee

router = APIRouter()

@router.get("/employees")
def get_employees():
    return {
        "served_by": os.getenv("HOSTNAME"),
        "employees": [
            Employee(id=1, name="John", department="IT"),
            Employee(id=2, name="Alice", department="HR"),
            Employee(id=3, name="Bob", department="Finance")
        ]
    }
