ALTER TABLE war_diary ADD COLUMN id UNSIGNED LONG INTEGER;
UPDATE war_diary SET id = ROWID;
