FROM python:3.12-slim

RUN useradd -m appuser
USER appuser

WORKDIR /app
COPY app.py .

CMD ["python", "app.py"]
