-- any row where cirp & form (Order of input matters)
select * from indsolv.forum where  array['cirp', 'form']::tags[] = tags

-- any row where cirp & form (Order of input doesn't matters)
select * from indsolv.forum where  array['cirp', 'form']::tags[] <@ tags

--
-- Any rows where the animal_whitelist is not dog, cat, or bird
select * from animals where not array['dog', 'cat', 'bird']::animal_whitelist[] && "whitelist";
