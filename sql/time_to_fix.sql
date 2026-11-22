-- Gjallar report: time_to_fix (same query as GET /api/v1/analytics/reports/time_to_fix)
SELECT unnest(namespaces) AS namespace, count(*) AS fixed,
  round(median(epoch(fixed_at - first_seen)) / 3600, 1) AS median_hours
  FROM finding_daily WHERE state = 'fixed' AND fixed_at IS NOT NULL GROUP BY ALL ORDER BY median_hours DESC;
