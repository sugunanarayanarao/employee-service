from fastapi import FastAPI
from .api import router

app = FastAPI(title="Employee Service")

app.include_router(router)
