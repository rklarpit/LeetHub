# Write your MySQL query statement below
select
    distinct a.id, 
    case 
        when a.p_id is null then 'Root'
        when b.p_id is null then 'Leaf'
        else 'Inner' 
    end as Type
from
    tree a
left join
    tree b
on
    a.id = b.p_id
