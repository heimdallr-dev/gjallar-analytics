-- Gjallar report: kev_exposure (same query as GET /api/v1/analytics/reports/kev_exposure)
SELECT vuln_id, package, count(DISTINCT digest) AS images, list(DISTINCT repository) AS repositories
  FROM (SELECT *, row_number() OVER (PARTITION BY id ORDER BY ts DESC) rn FROM finding_events) WHERE rn = 1 AND state = 'open' AND kev
  GROUP BY ALL ORDER BY images DESC;
