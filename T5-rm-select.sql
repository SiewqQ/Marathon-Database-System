/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T5-rm-select.sql

--Student ID: 35400145
--Student Name: Tan Siew Quin


/* Comments for your marker:




*/


/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT 
    t.team_name,

    to_char(carn_date,'DD-Mon-YYYY') AS carnival_date,

    TRIM(NVL(comp.comp_fname, '') ||
    CASE 
        WHEN comp.comp_fname IS NOT NULL AND comp.comp_lname IS NOT NULL THEN ' '
        ELSE ''
    END ||
    NVL(comp.comp_lname, '')) AS teamleader,

    (SELECT COUNT(*) 
     FROM ENTRY e2 
     WHERE e2.team_id = t.team_id 
     AND e2.entry_starttime IS NOT NULL
     AND e2.entry_finishtime IS NOT NULL) AS team_no_members 

FROM 
    TEAM t
    JOIN ENTRY e ON t.entry_no = e.entry_no AND t.event_id = e.event_id 
    JOIN COMPETITOR comp ON e.comp_no = comp.comp_no

WHERE 
    carn_date < sysdate 
    AND t.team_name IN (
        SELECT team_name
        FROM TEAM
        WHERE carn_date < sysdate
        GROUP BY team_name
        HAVING COUNT(*) = (
            SELECT MAX(COUNT(*))
            FROM TEAM
            WHERE carn_date < sysdate
            GROUP BY team_name
            )
        )
    
ORDER BY 
    t.team_name, carn_date;


/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT 
    et.eventtype_desc AS "Event",

    c.carn_name || ' held ' || TO_CHAR(c.carn_date, 'Dy DD-Mon-YYYY') AS "Carnival",

    TO_CHAR(en.entry_elapsedtime, 'HH24:MI:SS') AS "Current Record",

    LPAD(en.comp_no, 5, '0') || ' ' || 
    TRIM(NVL(comp.comp_fname, '') || 
    CASE 
        WHEN comp.comp_fname IS NOT NULL AND comp.comp_lname IS NOT NULL THEN ' ' 
        ELSE '' 
    END ||NVL(comp.comp_lname, '')) 
    AS "Competitor No and Name",

    RPAD(
        EXTRACT(YEAR FROM c.carn_date) - EXTRACT(YEAR FROM comp.comp_dob) -
        CASE 
            WHEN EXTRACT(MONTH FROM c.carn_date) < EXTRACT(MONTH FROM comp.comp_dob) OR
                 (EXTRACT(MONTH FROM c.carn_date) = EXTRACT(MONTH FROM comp.comp_dob) AND
                 EXTRACT(DAY FROM c.carn_date) < EXTRACT(DAY FROM comp.comp_dob))
            THEN 1 
            ELSE 0 
        END, 15, ' ') AS "Age at Carnival"

FROM 
    EVENT e
    JOIN EVENTTYPE et ON e.eventtype_code = et.eventtype_code
    JOIN CARNIVAL c ON e.carn_date = c.carn_date
    JOIN ENTRY en ON e.event_id = en.event_id
    JOIN COMPETITOR comp ON en.comp_no = comp.comp_no

WHERE
    en.entry_elapsedtime IS NOT NULL
    AND en.entry_elapsedtime = (
        SELECT MIN(en2.entry_elapsedtime)
        FROM EVENT e2
        JOIN ENTRY en2 ON e2.event_id = en2.event_id
        WHERE e2.eventtype_code = e.eventtype_code
        AND en2.entry_elapsedtime IS NOT NULL
    )
    
ORDER BY 
    "Event", en.comp_no;


/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT 
    c.carn_name AS "Carnival Name",

    TO_CHAR(c.carn_date, 'DD Mon YYYY') AS "Carnival Date",

    et.eventtype_desc AS "Event Description",

    CASE 
        WHEN ev.event_id IS NULL OR COUNT(e.entry_no) = 0 THEN 'Not offered'
        ELSE LPAD(TO_CHAR(COUNT(e.entry_no)), 17)
    END AS "Number of Entries",

    CASE 
        WHEN ev.event_id IS NULL OR COUNT(e.entry_no) = 0 OR total.total_entries = 0 THEN ' '
        ELSE LPAD(TO_CHAR(ROUND(COUNT(e.entry_no) * 100.0 / total.total_entries, 0)), 21)
    END AS "% of Carnival Entries"

FROM 
    CARNIVAL c
    CROSS JOIN EVENTTYPE et
    LEFT JOIN EVENT ev ON c.carn_date = ev.carn_date AND et.eventtype_code = ev.eventtype_code
    LEFT JOIN ENTRY e ON ev.event_id = e.event_id
    LEFT JOIN (
        SELECT 
            c2.carn_date,
            COUNT(e2.entry_no) AS total_entries
        FROM 
            CARNIVAL c2
            JOIN EVENT ev2 ON c2.carn_date = ev2.carn_date
            JOIN ENTRY e2 ON ev2.event_id = e2.event_id
        GROUP BY 
            c2.carn_date
    ) total ON c.carn_date = total.carn_date

GROUP BY 
    c.carn_name,
    c.carn_date,
    et.eventtype_desc,
    ev.event_id,
    total.total_entries
    
ORDER BY 
    c.carn_date,
    CASE WHEN ev.event_id IS NULL OR COUNT(e.entry_no) = 0
    THEN 0 ELSE 1 END,
    COUNT(e.entry_no) DESC,
    et.eventtype_desc;

