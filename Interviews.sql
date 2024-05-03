SELECT

con.contest_id.

con.hacker.id.

con.name

SUMiss.total submissions AS sum total submissions,

SUMiss.total_accepted_submissions) AS sum total_accepted_submissions, SUMivst.total_views AS sum_total views

SUMivst.total_unique_views AS sum total_unique views

FROM

Contests con

JOIN

Colleges cal ON con.contest_idcol.contest_id

JOIN

Challenges cha ON cha.college_id=col.college_id

LEFT JOIN

(SELECT

challenge_id,

SUM total views AS total views,

SUM total_unique_views AS total_unique_views

FROM

View Stats

GROUP BY

challenge idi vst ON vst.challenge_id=cha.challenge_id

LEFT JOIN

SELECT

challenge id,

SUM total submissions AS total_submissions,

SUM.total accepted_submissions AS total accepted submissions

FROM

Submission Stats

GROUP BY

challenge id ss ON ss.challenge_id = cha.challenge_id

GROUP BY

con.contest_id.

con.hacker id.

con.name

HAVING

sum total submissions sum total_accepted_submissions + sum total views + sum total_unique_views> 0

ORDER BY contest_id;