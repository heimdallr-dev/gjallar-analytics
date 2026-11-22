-- Gjallar report: top_packages (same query as GET /api/v1/analytics/reports/top_packages)
SELECT package, count(DISTINCT digest) AS images, count(*) AS findings, max(risk) AS max_risk
  FROM (SELECT *, row_number() OVER (PARTITION BY id ORDER BY ts DESC) rn FROM finding_events) WHERE rn = 1 AND state = 'open'
  GROUP BY package ORDER BY max_risk DESC, images DESC LIMIT 50;
