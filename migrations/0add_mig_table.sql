-- Step 0. Add migration table.
begin transaction;

CREATE TABLE migrations (version INTEGER PRIMARY KEY);
INSERT INTO migrations VALUES (0);

commit;