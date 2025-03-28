INSERT INTO current_states (object_id, state, updated_at, user_id, product_id, status) 
    SELECT DISTINCT ON (object_id) object_id, state, updated_at, user_id, product_id, status FROM history_states ORDER BY object_id, updated_at DESC;


SELECT c.object_id, c.state AS current_state, h.state AS previous_state, h.updated_at
FROM current_states c
LEFT JOIN LATERAL (
    SELECT state, updated_at 
    FROM history_states h 
    WHERE h.object_id = c.object_id 
    ORDER BY updated_at DESC 
    LIMIT 1
) h ON true;


select * from (select *, rank() OVER (partition by object_id order by updated_at desc) as rank_value from history_states) as a where rank_value = 2;