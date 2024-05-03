
SELECT 
    con.contest_id, 
    con.hacker_id, 
    con.name, 
    SUM(ss.total_submissions) AS sum_total_submissions,
    SUM(ss.total_accepted_submissions) AS sum_total_accepted_submissions, 
    SUM(vst.total_views) AS sum_total_views,  
    SUM(vst.total_unique_views) AS sum_total_unique_views
FROM 
    Contests con
JOIN 
    Colleges col ON con.contest_id = col.contest_id
JOIN 
    Challenges cha ON cha.college_id = col.college_id
LEFT JOIN 
    (SELECT 
        challenge_id, 
        SUM(total_views) AS total_views,
        SUM(total_unique_views) AS total_unique_views
    FROM 
        View_Stats
    GROUP BY 
        challenge_id) vst ON vst.challenge_id = cha.challenge_id
LEFT JOIN 
    (SELECT 
        challenge_id, 
        SUM(total_submissions) AS total_submissions,
        SUM(total_accepted_submissions) AS total_accepted_submissions
    FROM 
        Submission_Stats
    GROUP BY 
        challenge_id) ss ON ss.challenge_id = cha.challenge_id
GROUP BY 
    con.contest_id, 
    con.hacker_id, 
    con.name
HAVING 
    sum_total_submissions + sum_total_accepted_submissions + sum_total_views + sum_total_unique_views > 0
ORDER BY 
    contest_id;
