-- Gjallar report: runtime_loaded_packages (same query as GET /api/v1/analytics/reports/runtime_loaded_packages)
SELECT package, count(DISTINCT digest) AS images, min(ts) AS first_seen_loading
  FROM runtime_loaded GROUP BY package ORDER BY images DESC LIMIT 200;
