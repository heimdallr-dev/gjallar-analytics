-- Gjallar report: posture_by_check (same query as GET /api/v1/analytics/reports/posture_by_check)
SELECT check_id, severity, count(DISTINCT workload_id) AS workloads
  FROM posture_events WHERE day = (SELECT max(day) FROM posture_events) GROUP BY ALL ORDER BY workloads DESC;
