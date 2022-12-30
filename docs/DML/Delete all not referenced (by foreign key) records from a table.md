

    DELETE FROM table_1 WHERE table_1_pk_id NOT IN (SELECT table_1_pk_id FROM table_2)
