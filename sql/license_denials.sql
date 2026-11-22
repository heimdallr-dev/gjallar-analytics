-- Gjallar report: license_denials (same query as GET /api/v1/analytics/reports/license_denials)
SELECT license, count(DISTINCT package) AS packages, count(DISTINCT digest) AS images
  FROM package_licenses WHERE verdict = 'denied' GROUP BY license ORDER BY images DESC;
