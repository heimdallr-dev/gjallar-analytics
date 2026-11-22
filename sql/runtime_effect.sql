-- Gjallar report: runtime_effect (same query as GET /api/v1/analytics/reports/runtime_effect)
SELECT runtime, band, count(*) AS findings, round(avg(risk), 1) AS avg_risk
  FROM (SELECT *, row_number() OVER (PARTITION BY id ORDER BY ts DESC) rn FROM risk_scores) WHERE rn = 1
  GROUP BY ALL ORDER BY runtime, band;
