--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-rm-dm.sql

--Student ID: 35400145
--Student Name: Tan Siew Quin

/* Comments for your marker:




*/

--(a)

DROP SEQUENCE competitor_seq;
CREATE SEQUENCE competitor_seq
    START WITH 100 INCREMENT BY 5;

DROP SEQUENCE team_seq;
CREATE SEQUENCE team_seq
    START WITH 100 INCREMENT BY 5;

--(b)

-- Record details of Keith Rose
INSERT INTO competitor VALUES (
    competitor_seq.NEXTVAL, 
    'Keith', 
    'Rose', 
    'M', 
    TO_DATE('2004-01-15', 'YYYY-MM-DD'), 
    'keith.rose@monash.student.edu', 
    'Y', 
    '0422141112');

INSERT INTO entry VALUES (
    (SELECT e.event_id
    FROM event e
    JOIN eventtype et ON e.eventtype_code = et.eventtype_code
    JOIN carnival c ON e.carn_date = c.carn_date
    WHERE 
        UPPER(c.carn_name) = 'RM WINTER SERIES CAULFIELD 2025'
        AND UPPER(et.eventtype_desc) = UPPER('10 km run')),

    (SELECT MAX(entry_no) + 1 
    FROM entry
    WHERE event_id = (
        SELECT e.event_id
        FROM event e
        JOIN eventtype et ON e.eventtype_code = et.eventtype_code
        JOIN carnival c ON e.carn_date = c.carn_date
        WHERE 
            UPPER(c.carn_name) = 'RM WINTER SERIES CAULFIELD 2025'
            AND UPPER(et.eventtype_desc) = UPPER('10 km run'))),

    NULL, 
    NULL, 
    NULL, 

    (SELECT comp_no 
    FROM competitor 
    WHERE comp_phone = '0422141112'),

    NULL, --will be updated later 

    (SELECT char_id 
    FROM charity 
    WHERE UPPER(char_name) = UPPER('Salvation Army'))
);


INSERT INTO team VALUES (
    team_seq.NEXTVAL, 
    'Super Runners', 

    (SELECT carn_date 
    FROM carnival 
    WHERE upper(carn_name) = 'RM WINTER SERIES CAULFIELD 2025'),
     
    (SELECT e.event_id
    FROM event e
    JOIN eventtype et ON e.eventtype_code = et.eventtype_code
    JOIN carnival c ON e.carn_date = c.carn_date
    WHERE 
        UPPER(c.carn_name) = 'RM WINTER SERIES CAULFIELD 2025'
        AND UPPER(et.eventtype_desc) = UPPER('10 km run')),

    (SELECT MAX(entry_no)
    FROM entry
    WHERE event_id = (
        SELECT e.event_id
        FROM event e
        JOIN eventtype et ON e.eventtype_code = et.eventtype_code
        JOIN carnival c ON e.carn_date = c.carn_date
        WHERE 
            UPPER(c.carn_name) = 'RM WINTER SERIES CAULFIELD 2025'
            AND UPPER(et.eventtype_desc) = UPPER('10 km run')))
);

--Update entry table to include the team_id for Keith Rose
UPDATE entry 
SET team_id = (
    SELECT team_id
    FROM team
    WHERE UPPER(team_name) = UPPER('Super Runners')
    AND carn_date = (
        SELECT carn_date 
        FROM carnival 
        WHERE UPPER(carn_name) = 'RM WINTER SERIES CAULFIELD 2025'
    )
)
WHERE comp_no = (
    SELECT comp_no 
    FROM competitor 
    WHERE comp_phone = '0422141112'
    )
    AND event_id = (
        SELECT e.event_id
        FROM event e
        JOIN carnival c ON e.carn_date = c.carn_date
        JOIN eventtype et ON e.eventtype_code = et.eventtype_code
        WHERE UPPER(c.carn_name) = 'RM WINTER SERIES CAULFIELD 2025'
        AND UPPER(et.eventtype_desc) = upper('10 km run')
    );


-- Record details of Jackson Bull
INSERT INTO competitor VALUES (
    competitor_seq.NEXTVAL, 
    'Jackson', 
    'Bull', 
    'M', 
    TO_DATE('2003-03-22', 'YYYY-MM-DD'), 
    'jack.bull@monash.student.edu', 
    'Y', 
    '0422412524');

INSERT INTO entry VALUES (
    (SELECT e.event_id
    FROM event e
    JOIN eventtype et ON e.eventtype_code = et.eventtype_code
    JOIN carnival c ON e.carn_date = c.carn_date
    WHERE 
        UPPER(c.carn_name) = 'RM WINTER SERIES CAULFIELD 2025'
        AND UPPER(et.eventtype_desc) = UPPER('10 km run')),

    (SELECT MAX(entry_no) + 1 
    FROM entry
    WHERE event_id = (
        SELECT e.event_id
        FROM event e
        JOIN eventtype et ON e.eventtype_code = et.eventtype_code
        JOIN carnival c ON e.carn_date = c.carn_date
        WHERE 
            UPPER(c.carn_name) = 'RM WINTER SERIES CAULFIELD 2025'
            AND UPPER(et.eventtype_desc) = UPPER('10 km run'))),

    NULL, 
    NULL, 
    NULL, 
 
    (SELECT comp_no 
    FROM competitor 
    WHERE comp_phone = '0422412524'), 

    (SELECT team_id 
    FROM team 
    WHERE UPPER(team_name) = UPPER('Super Runners')
    AND carn_date = (
        SELECT carn_date 
        FROM carnival 
        WHERE UPPER(carn_name) = 'RM WINTER SERIES CAULFIELD 2025'
        )
    ),

    (SELECT char_id FROM charity 
    WHERE UPPER(char_name) = 'RSPCA')
);

COMMIT;

--(c)

UPDATE entry

SET 
    event_id = (
        SELECT e.event_id
        FROM event e
        JOIN eventtype et ON e.eventtype_code = et.eventtype_code
        JOIN carnival c ON e.carn_date = c.carn_date
        WHERE 
            UPPER(c.carn_name) = 'RM WINTER SERIES CAULFIELD 2025'
            AND UPPER(et.eventtype_desc) = UPPER('5 km run')
    ),

    entry_no = (
        SELECT MAX(entry_no) + 1 
        FROM entry
        WHERE event_id = (
            SELECT e.event_id
            FROM event e
            JOIN eventtype et ON e.eventtype_code = et.eventtype_code
            JOIN carnival c ON e.carn_date = c.carn_date
            WHERE 
                UPPER(c.carn_name) = 'RM WINTER SERIES CAULFIELD 2025'
                AND UPPER(et.eventtype_desc) = UPPER('5 km run')
        )
    ),

    char_id = (
        SELECT char_id 
        FROM charity 
        WHERE UPPER(char_name) = UPPER('Beyond Blue')
    )

WHERE comp_no = (
    SELECT comp_no 
    FROM competitor 
    WHERE comp_phone = '0422412524')

AND event_id = (
    SELECT e.event_id
    FROM event e
    JOIN eventtype et ON e.eventtype_code = et.eventtype_code
    JOIN carnival c ON e.carn_date = c.carn_date
    WHERE 
        UPPER(c.carn_name) = 'RM WINTER SERIES CAULFIELD 2025'
        AND UPPER(et.eventtype_desc) = UPPER('10 km run')
);

COMMIT; 

--(d)

UPDATE entry

SET 
    team_id = NULL

WHERE team_id = ( 
    SELECT team_id 
    FROM team
    WHERE UPPER(team_name) = UPPER('Super Runners')
    AND carn_date = (
        SELECT carn_date
        FROM carnival
        WHERE UPPER(carn_name) = 'RM WINTER SERIES CAULFIELD 2025'
    )
);

-- delete the team record of Super Runners
DELETE FROM team
WHERE UPPER(team_name) = UPPER('Super Runners')
AND carn_date = (
    SELECT carn_date
    FROM carnival
    WHERE UPPER(carn_name) = 'RM WINTER SERIES CAULFIELD 2025'
);

-- finally delete Keith's entry for this carnival
DELETE FROM entry
WHERE comp_no = (
    SELECT comp_no
    FROM competitor
    WHERE comp_phone = '0422141112'
)
AND event_id IN (
    SELECT event_id 
    FROM event 
    WHERE carn_date = (
        SELECT carn_date
        FROM carnival
        WHERE UPPER(carn_name) = 'RM WINTER SERIES CAULFIELD 2025'
    )
);

COMMIT;