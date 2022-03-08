SELECT AVG(foo.total_duration) AS average_total_duration
FROM (SELECT SUM(assistance_requests.completed_at - assistance_requests.started_at) AS total_duration
FROM cohorts
JOIN students ON students.cohort_id = cohorts.id
JOIN assistance_requests ON assistance_requests.student_id = students.id
GROUP BY cohorts.name
ORDER BY total_duration) AS foo