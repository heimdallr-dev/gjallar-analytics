# gjallar-analytics

Ways to work with Gjallar's history yourself: notebooks, SQL and clients.
The analytics *service* lives in the core repo
([cmd/gjallar-analytics](https://github.com/heimdallr-dev/gjallar/tree/main/cmd/gjallar-analytics));
this repo is for the people reading the data.

What you learn about your systems is yours: it is stored as Parquet (with an
optional DuckLake catalog in your Postgres), so any engine can read it
without Gjallar.

| Path | What |
|---|---|
| `sql/*.sql` | The curated reports (`risk_trend`, `time_to_fix`, `kev_exposure`, `runtime_effect`, `package_inventory`, ...), runnable in DuckDB |
| `examples/flight_sql.py` | Arrow Flight SQL (port 8815) into Polars |
| `examples/ducklake_attach.py` | Read the lakehouse directly from S3 + Postgres, read-only |
| `examples/parquet_mode.sql` | Parquet-only installs (no catalog) |

Tables: `finding_events`, `finding_daily`, `risk_scores` (score + inputs),
`sbom_packages`, `runtime_loaded`, `package_licenses`, `posture_events`,
`workload_images`, `patch_events`, `audit_events`. Schema and examples:
[analytics guide](https://github.com/heimdallr-dev/gjallar-docs/blob/main/docs/analytics.md).

Apache-2.0.
