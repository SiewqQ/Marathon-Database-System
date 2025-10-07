/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-rm-json.sql

--Student ID: 35400145
--Student Name: Tan Siew Quin


/* Comments for your marker:




*/


-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SET PAGESIZE 300

SELECT JSON_OBJECT(
        '_id' VALUE t.team_id,
        'carn_name' VALUE c.carn_name,
        'carn_date' VALUE TO_CHAR(c.carn_date, 'DD-Mon-YYYY'),
        'team_name' VALUE t.team_name,

        'team_leader' VALUE JSON_OBJECT(
            'name' VALUE NVL(TRIM(NVL(cl.comp_fname, '') || ' ' || NVL(cl.comp_lname, '')), '-'),
            'phone' VALUE cl.comp_phone,
            'email' VALUE cl.comp_email
        ),

        'team_no_of_members' VALUE COUNT(*),

        'team_members' VALUE JSON_ARRAYAGG(
            JSON_OBJECT(
                'competitor_name' VALUE NVL(TRIM(NVL(comp.comp_fname, '') || ' ' || NVL(comp.comp_lname, '')), '-'),
                'competitor_phone' VALUE comp.comp_phone,
                'event_type' VALUE et.eventtype_desc,
                'entry_no' VALUE e.entry_no,
                'starttime' VALUE NVL(TO_CHAR(e.entry_starttime, 'HH24:MI:SS'), '-'),
                'finishtime' VALUE NVL(TO_CHAR(e.entry_finishtime, 'HH24:MI:SS'), '-'),
                'elapsedtime' VALUE NVL(TO_CHAR(e.entry_elapsedtime, 'HH24:MI:SS'), '-')
            )
            ORDER BY t.team_id 
        )
FORMAT JSON) || ','

FROM TEAM t
JOIN CARNIVAL c ON t.carn_date = c.carn_date

-- Join to get team leader
JOIN ENTRY el ON el.entry_no = t.entry_no AND el.event_id = t.event_id
JOIN COMPETITOR cl ON el.comp_no = cl.comp_no

-- Join to get all team members and their data
JOIN ENTRY e ON e.team_id = t.team_id
JOIN COMPETITOR comp ON e.comp_no = comp.comp_no
JOIN EVENT ev ON e.event_id = ev.event_id
JOIN EVENTTYPE et ON ev.eventtype_code = et.eventtype_code

GROUP BY 
    t.team_id, 
    t.team_name,
    c.carn_name, 
    c.carn_date,
    NVL(TRIM(NVL(cl.comp_fname, '') || ' ' || NVL(cl.comp_lname, '')), '-'), 
    cl.comp_phone, 
    cl.comp_email

ORDER BY t.team_id;
