select s1.submission_date, count distinct s1.hacker_id),

select hacker_id

from submissions s3

where s3.submission_date = s1.submission_date

group by hacker_id

order by count submission_id) Desc, min(hacker_id) asc limit 1

as h_id.

( select h.name from hackers h

where h.hacker_id = h_id

from submissions s1

where datediff(s1.submission_date, '2016-03-01') + 1 =

select count distinct s2.submission_date)

from submissions s2

where s2.submission_date <= s1.submission_date and s2.hacker_id = s1.hacker_id

group by s1.submission_date: