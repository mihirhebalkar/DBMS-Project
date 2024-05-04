select  Case when g.grade>7 then s.name
        else 'NULL'
        END 
        as name,
        g.grade,
        s.marks
from students s 
join grades g on s.marks between g.min_mark and g.max_mark
order by g.grade desc, s.name asc, s.marks asc;
