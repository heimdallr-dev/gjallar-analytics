"""Query the Gjallar lakehouse over Arrow Flight SQL (typed Arrow batches, no JSON).

pip install adbc-driver-flightsql pyarrow polars
GJALLAR_FLIGHT=grpc://localhost:8815 GJALLAR_TOKEN=... python flight_sql.py
(kubectl -n gjallar port-forward svc/gjallar-analytics 8815:8815)
"""
import os

import adbc_driver_flightsql.dbapi as flight
import polars as pl

kwargs = {}
if token := os.environ.get("GJALLAR_TOKEN"):  # needs a fleet-wide role when auth is on
    kwargs["db_kwargs"] = {"adbc.flight.sql.authorization_header": f"Bearer {token}"}

with flight.connect(os.environ.get("GJALLAR_FLIGHT", "grpc://localhost:8815"), **kwargs) as con:
    cur = con.cursor()
    sql = open(os.path.join(os.path.dirname(__file__), "..", "sql", "runtime_effect.sql")).read()
    cur.execute(sql)
    df = pl.from_arrow(cur.fetch_arrow_table())
    print(df)
