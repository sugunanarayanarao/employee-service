FROM python:3.12-slim

WORKDIR /app

COPY dist/*.whl .

RUN pip install *.whl

EXPOSE 8080

CMD ["uvicorn", "employee_service.main:app", "--host", "0.0.0.0", "--port", "8080"]
