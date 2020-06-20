insert into public.user(id, firstname) values(generate_series(1, 100), MD5(random()::text));
