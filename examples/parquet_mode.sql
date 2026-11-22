-- Parquet mode (no catalog): point DuckDB at the analytics volume or bucket.
-- duckdb -c ".read examples/parquet_mode.sql"
SELECT vuln_id, package, max(risk) AS risk
FROM read_parquet('/data/lake/finding_events/**/*.parquet', hive_partitioning = true)
GROUP BY ALL ORDER BY risk DESC LIMIT 20;
