"""Read the lakehouse directly with DuckDB: no Gjallar service in the path.
Your data, open formats (Parquet + DuckLake catalog in Postgres).

pip install duckdb
"""
import os

import duckdb

con = duckdb.connect()
con.sql("INSTALL ducklake; LOAD ducklake; INSTALL httpfs; LOAD httpfs;")
con.sql(f"""CREATE SECRET (TYPE s3, KEY_ID '{os.environ['S3_KEY']}', SECRET '{os.environ['S3_SECRET']}',
            ENDPOINT '{os.environ.get('S3_ENDPOINT', 'localhost:9000')}', URL_STYLE 'path', USE_SSL false)""")
con.sql(f"""ATTACH 'ducklake:postgres:{os.environ['CATALOG']}' AS lake
            (DATA_PATH '{os.environ.get('DATA_PATH', 's3://gjallar-lake/')}', READ_ONLY)""")
print(con.sql("SELECT band, count(*) FROM lake.finding_daily WHERE day = current_date GROUP BY ALL"))
