--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-rm-mods.sql

--Student ID: 35400145
--Student Name: Tan Siew Quin

/* Comments for your marker:




*/

--(a)
ALTER TABLE competitor 
    ADD (comp_completed_events NUMBER(2) DEFAULT 0 NOT NULL);

COMMENT ON COLUMN competitor.comp_completed_events IS 
    'Number of events completed by this competitor';

-- Update with current completed events count
UPDATE competitor c
SET comp_completed_events = (
    SELECT COUNT(*) 
    FROM entry e
    WHERE e.comp_no = c.comp_no
    AND e.entry_starttime IS NOT NULL
    AND e.entry_finishtime IS NOT NULL-- only if the event is actually completed by competitor
); 

COMMIT;

-- Verification statements for Task 4(a)
DESC competitor;
SELECT * FROM competitor;


--(b)
-- first, create a sequence for surrogate key charity_entry_id
DROP SEQUENCE charity_entry_seq;
CREATE SEQUENCE charity_entry_seq START WITH 1 INCREMENT BY 1;

-- create new junction table between charity and entry
DROP TABLE charity_entry CASCADE CONSTRAINTS PURGE;

CREATE TABLE charity_entry (
    charity_entry_id NUMBER(4) NOT NULL, --surrogate key added 
    entry_no NUMBER(5) NOT NULL,
    char_id NUMBER(3) NOT NULL,
    event_id NUMBER(6) NOT NULL, 
    char_entry_percentage NUMBER(3) NOT NULL
);

COMMENT ON COLUMN charity_entry.charity_entry_id IS 
    'Charity entry (Surrogate primary key)'; 
COMMENT ON COLUMN charity_entry.entry_no IS 
    'Entry number (unique only within an event)';
COMMENT ON COLUMN charity_entry.char_id IS 
    'Charity identifier';
COMMENT ON COLUMN charity_entry.event_id IS 
    'Event identifier';
COMMENT ON COLUMN charity_entry.char_entry_percentage IS 
    'Percentage of funds allocated to this charity (0-100)';

ALTER TABLE charity_entry 
    ADD CONSTRAINT pk_charity_entry PRIMARY KEY (charity_entry_id);

ALTER TABLE charity_entry 
    ADD CONSTRAINT uq_charity_entry_id UNIQUE (entry_no, char_id, event_id);

ALTER TABLE charity_entry 
    ADD CONSTRAINT chk_char_entry_percentage_value CHECK (char_entry_percentage BETWEEN 0 AND 100);

ALTER TABLE charity_entry
     ADD CONSTRAINT fk_cc_entry FOREIGN KEY (entry_no, event_id) 
        REFERENCES entry(entry_no, event_id);

ALTER TABLE charity_entry 
    ADD CONSTRAINT fk_cc_charity FOREIGN KEY (char_id)  
        REFERENCES charity(char_id);

-- move existing single-charity relationships to new table
INSERT INTO charity_entry (charity_entry_id, entry_no, char_id, event_id, char_entry_percentage)
SELECT charity_entry_seq.NEXTVAL, e.entry_no, e.char_id, e.event_id, 100
FROM entry e
WHERE e.char_id IS NOT NULL;

-- remove old charity reference from ENTRY table to prevent duplicates 
ALTER TABLE entry DROP COLUMN char_id;

COMMIT; 

-- Verification statements for Task 4(b)
DESC charity_entry;
select * from charity_entry;

DESC entry;
select event_id, entry_no, to_char(entry_starttime, 'HH24:MI:SS') as entry_starttime, to_char(entry_finishtime,'HH24:MI:SS') as entry_finishtime, to_char(entry_elapsedtime, 'HH24:MI:SS') as entry_elapsedtime,
comp_no, team_id from entry;
