# Istanbul Mobility Data Pipeline

End-to-end data pipeline that analyzes hourly public transport usage in Istanbul, enriched with weather and public holiday data.

> 🚧 Work in progress.

## Business question

How does public transport usage in Istanbul change by hour, day of week, transport mode, line, weather and public holidays? What operational decisions (service scheduling, capacity planning, extra trips on rainy days) can IMM (İBB) make from this data?

## Architecture

```
CSV / API → Python ingestion → PostgreSQL [raw] → SQL / dbt [staging → intermediate → marts] → BI dashboard
```

## Data sources

| Source | Description |
|---|---|
| [IMM Open Data Portal](https://data.ibb.gov.tr) – Hourly Public Transport Data Set | Monthly CSVs with hourly ridership by line and transport type |
| [Open-Meteo Historical Weather API](https://open-meteo.com) | Hourly temperature and precipitation for Istanbul |
| [`holidays`](https://pypi.org/project/holidays/) Python package | Turkish public holidays |

## Tech stack

Python · PostgreSQL 16 (Docker) · SQL · dbt *(planned)* · GitHub Actions *(planned)* · Power BI / Tableau *(planned)*

## Getting started

### Prerequisites

- Docker with Compose v2 (e.g. Docker Desktop)
- Python 3.11+
- `make`

### Setup

```bash
git clone https://github.com/ahassas/istanbul-mobility-pipeline.git
cd istanbul-mobility-pipeline
cp .env.example .env
make up      # start PostgreSQL and wait until it is healthy
make psql    # open a SQL shell
make help    # list all commands
```

