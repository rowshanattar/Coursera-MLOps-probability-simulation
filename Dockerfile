FROM python:3.12-slim
LABEL org.opencontainers.image.source=https://github.com/rowshanattar/Coursera-MLOps-probability-simulation
WORKDIR /app
RUN pip install --no-cache-dir click==8.1.3
COPY startup_game.py .
ENTRYPOINT ["python", "startup_game.py"]