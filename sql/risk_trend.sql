-- Gjallar report: risk_trend (same query as GET /api/v1/analytics/reports/risk_trend)
SELECT day, band, count(*) AS findings FROM finding_daily WHERE state = 'open'
  GROUP BY ALL ORDER BY day, band;
