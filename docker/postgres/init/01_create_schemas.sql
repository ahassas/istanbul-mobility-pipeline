-- Runs only on first container start (when the data volume is empty).
-- raw:     data exactly as it arrives from sources (loaded by Python in M1)
-- staging: cleaned, typed versions of raw tables (hand-written SQL in M2)
CREATE SCHEMA IF NOT EXISTS raw;
CREATE SCHEMA IF NOT EXISTS staging;
