# ── Base image ───────────────────────────────────────────────────────────────
FROM python:3.9-slim

# ── Working directory ─────────────────────────────────────────────────────────
WORKDIR /app

# ── Install dependencies first (cached layer) ─────────────────────────────────
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ── Copy source files ─────────────────────────────────────────────────────────
COPY run.py        .
COPY config.yaml   .
COPY data.csv      .

# ── Default command ───────────────────────────────────────────────────────────
CMD ["python", "run.py", \
     "--input",    "data.csv", \
     "--config",   "config.yaml", \
     "--output",   "metrics.json", \
     "--log-file", "run.log"]
