-- Gjallar report: package_inventory (same query as GET /api/v1/analytics/reports/package_inventory)
SELECT package, count(DISTINCT digest) AS images, list(DISTINCT version) AS versions, list(DISTINCT repository) AS repositories
  FROM sbom_packages GROUP BY package ORDER BY images DESC LIMIT 200;
