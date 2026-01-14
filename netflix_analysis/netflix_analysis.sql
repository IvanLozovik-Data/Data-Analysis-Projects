-- Project: Netflix Content Strategy Analysis
-- Author: Ivan Lozovik
-- Goal: Categorize Netflix content by era and type to understand library growth.

WITH content_categories AS (
    SELECT 
        title,
        type,
        release_year,
        country,
        CASE 
            WHEN release_year >= 2020 THEN 'Modern'
            WHEN release_year BETWEEN 2010 AND 2019 THEN 'Recent'
            ELSE 'Classic'
        END AS era
    FROM netflix_titles
)
SELECT 
    era,
    type,
    COUNT(*) AS total_titles,
    ROUND(AVG(release_year), 0) AS avg_year -- Added a small extra stat for depth
FROM content_categories
GROUP BY era, type
ORDER BY era DESC, total_titles DESC;