# ==========================
# Stage 1 - Build
# ==========================
FROM python:3.8-slim AS builder

WORKDIR /build

# Copy source code
COPY . .

# Install build tools
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir build

# Build wheel and source distribution
RUN python -m build


# ==========================
# Stage 2 - Runtime
# ==========================
FROM python:3.8-slim

WORKDIR /app

# Copy wheel from builder stage
COPY --from=builder /build/dist/*.whl .

# Install the wheel
RUN pip install --no-cache-dir *.whl

EXPOSE 8080

CMD ["uvicorn", "employee_service.main:app", "--host", "0.0.0.0", "--port", "8081"]
