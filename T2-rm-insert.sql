/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-rm-insert.sql

--Student ID: 35400145
--Student Name: Tan Siew Quin

/* Comments for your marker:

Citation of AI tool usage:
I used DeepSeek to generate and populate the required data as per the instructions outlined in Task 2. 
While this tool was helpful in providing a structured starting point, I noticed that some of the generated values were not logically consistent or realistic in the context of the Run Monash database.
For example, event times that were implausibly short, mismatches between event types and their corresponding elapsed times, or inconsistencies in date formats.
Therefore, I made manual adjustments to several entries after prompting it.
Firstly, I uploaded the picture of the ERD and scenario case study to DeepSeek, then I used the following prompts:

Load the COMPETITOR, ENTRY, and TEAM tables with your own test data using the T2-rm-insert.sql. Add (write) SQL commands to T2-rm-insert.sql that will insert as a minimum (i.e. you may and should insert more) the following sample data: (i) 15 COMPETITOR entries. Have at least 5 competitors who are Monash student/staff. Have at least 5 competitors who are not Monash student/staff (ii) 30 ENTRY entries. Included at least 10 competitors. Included at least 6 events from 3 different carnivals. Have at least 5 competitors who join more than 2 events. Have at least 2 uncompleted entries (registration only) (iii) 5 TEAM entries. Have at least 2 teams with more than 2 members. At least one team name is used in two different carnivals (eg, the team name 'Coyotes' is used in two different carnivals).
In adding this data, you must ensure that the test data thoroughly tests the model as supplied to ensure your schema is correct (you are not required to submit or code fail tests; all insert statements must execute correctly). Your inserted data must conform to the following rules: (i) Treat all the data you add as a single transaction since you are setting up the initial test state for the database. (ii) The primary key values for this data should be hardcoded values (i.e. NOT make use of sequences). If the primary key attributes data type is numeric, it must consist of values below 100. (iii) The data added must be sensible, e.g. entry finish times should be after entry start times with a sensible elapsed time.
For this task ONLY, Task 2, you may manually look up/calculate and include values for the loaded tables/data directly where required. However, you can still use SQL to get any non-key values if you wish

Above is the instruction, please send me the datas that fullfill the requirements of the task. 

*/

-- Task 2 Load the COMPETITOR, ENTRY and TEAM tables with your own
-- test data following the data requirements expressed in the brief

-- =======================================
-- COMPETITOR
-- =======================================
INSERT INTO competitor VALUES (1, 'James', 'Wilson', 'M', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'james.wilson@monash.student.edu', 'Y', '0412345678');
INSERT INTO competitor VALUES (2, 'Sarah', 'Chen', 'F', TO_DATE('1992-08-22', 'YYYY-MM-DD'), 'sarah.chen@monash.student.edu', 'Y', '0423456789');
INSERT INTO competitor VALUES (3, 'Michael', 'Brown', 'M', TO_DATE('1988-03-10', 'YYYY-MM-DD'), 'michael.brown@monash.student.edu', 'Y', '0434567890');
INSERT INTO competitor VALUES (4, 'Emily', 'Davis', 'F', TO_DATE('1993-11-05', 'YYYY-MM-DD'), 'emily.davis@monash.student.edu', 'Y', '0445678901');
INSERT INTO competitor VALUES (5, 'David', 'Taylor', 'M', TO_DATE('1991-07-18', 'YYYY-MM-DD'), 'david.taylor@monash.student.edu', 'Y', '0456789012');
INSERT INTO competitor VALUES (6, 'Jessica', 'Lee', 'F', TO_DATE('1987-09-30', 'YYYY-MM-DD'), 'jessica.lee@monash.student.edu', 'Y', '0467890123');
INSERT INTO competitor VALUES (7, 'Robert', 'Smith', 'M', TO_DATE('1994-04-25', 'YYYY-MM-DD'), 'robert.smith@gmail.com', 'N', '0478901234');
INSERT INTO competitor VALUES (8, 'Amanda', 'Johnson', 'F', TO_DATE('1989-12-12', 'YYYY-MM-DD'), 'amanda.johnson@gmail.com', 'N', '0489012345');
INSERT INTO competitor VALUES (9, 'Daniel', 'Nguyen', 'M', TO_DATE('1995-06-08', 'YYYY-MM-DD'), 'daniel.nguyen@gmail.com', 'N', '0490123456');
INSERT INTO competitor VALUES (10, 'Olivia', 'Martin', 'F', TO_DATE('1986-02-14', 'YYYY-MM-DD'), 'olivia.martin@gmail.com', 'N', '0401234567');
INSERT INTO competitor VALUES (11, 'William', 'Anderson', 'M', TO_DATE('1992-10-20', 'YYYY-MM-DD'), 'william.anderson@gmail.com', 'N', '0411122334');
INSERT INTO competitor VALUES (12, 'Sophia', 'Thomas', 'F', TO_DATE('1988-01-05', 'YYYY-MM-DD'), 'sophia.thomas@gmail.com', 'N', '0422233445');
INSERT INTO competitor VALUES (13, 'Benjamin', 'Jackson', 'M', TO_DATE('1993-07-30', 'YYYY-MM-DD'), 'benjamin.jackson@gmail.com', 'N', '0433344556');
INSERT INTO competitor VALUES (14, 'Charlotte', 'White', 'F', TO_DATE('1987-11-15', 'YYYY-MM-DD'), 'charlotte.white@gmail.com', 'N', '0444455667');
INSERT INTO competitor VALUES (15, 'Ethan', 'Harris', 'M', TO_DATE('1990-04-22', 'YYYY-MM-DD'), 'ethan.harris@gmail.com', 'N', '0455566778');  


-- =======================================
-- ENTRY
-- =======================================
-- Carnival 1 (RM Spring Series Clayton 2024 - 22/SEP/2024)
-- Event 1: 5K 
INSERT INTO entry VALUES (1, 1, TO_DATE('09:31:00', 'HH24:MI:SS'), TO_DATE('10:10:30', 'HH24:MI:SS'), TO_DATE('00:39:30', 'HH24:MI:SS'), 1, NULL, NULL);
INSERT INTO entry VALUES (1, 2, TO_DATE('09:32:00', 'HH24:MI:SS'), TO_DATE('10:12:15', 'HH24:MI:SS'), TO_DATE('00:40:15', 'HH24:MI:SS'), 2, NULL, NULL);
INSERT INTO entry VALUES (1, 3, TO_DATE('09:33:00', 'HH24:MI:SS'), TO_DATE('10:18:45', 'HH24:MI:SS'), TO_DATE('00:45:45', 'HH24:MI:SS'), 3, NULL, NULL);
INSERT INTO entry VALUES (1, 4, TO_DATE('09:34:00', 'HH24:MI:SS'), TO_DATE('10:29:45', 'HH24:MI:SS'), TO_DATE('00:55:45', 'HH24:MI:SS'), 11, NULL, NULL);


-- Carnival 2 (RM Spring Series Caulfield 2024 - 05/OCT/2024)
-- Event 3: 5K
INSERT INTO entry VALUES (3, 1, TO_DATE('09:01:30', 'HH24:MI:SS'), TO_DATE('09:36:40', 'HH24:MI:SS'), TO_DATE('00:35:10', 'HH24:MI:SS'), 4, NULL, NULL); 
INSERT INTO entry VALUES (3, 2, TO_DATE('09:01:00', 'HH24:MI:SS'), TO_DATE('09:41:25', 'HH24:MI:SS'), TO_DATE('00:40:25', 'HH24:MI:SS'), 5, NULL, NULL);
INSERT INTO entry VALUES (3, 3, TO_DATE('09:01:10', 'HH24:MI:SS'), TO_DATE('09:46:35', 'HH24:MI:SS'), TO_DATE('00:45:25', 'HH24:MI:SS'), 6, NULL, NULL);
INSERT INTO entry VALUES (3, 4, TO_DATE('09:01:05', 'HH24:MI:SS'), TO_DATE('09:44:30', 'HH24:MI:SS'), TO_DATE('00:43:25', 'HH24:MI:SS'), 12, NULL, NULL);
INSERT INTO entry VALUES (3, 5, NULL, NULL, NULL, 13 , NULL, NULL); -- Uncompleted entry

-- Event 4: 10K
INSERT INTO entry VALUES (4, 1, TO_DATE('08:32:00', 'HH24:MI:SS'), TO_DATE('09:47:20', 'HH24:MI:SS'), TO_DATE('01:15:20', 'HH24:MI:SS'), 7, NULL, NULL);
INSERT INTO entry VALUES (4, 2, TO_DATE('08:31:00', 'HH24:MI:SS'), TO_DATE('09:31:15', 'HH24:MI:SS'), TO_DATE('01:00:15', 'HH24:MI:SS'), 8, NULL, NULL);
INSERT INTO entry VALUES (4, 3, TO_DATE('08:31:10', 'HH24:MI:SS'), TO_DATE('10:01:25', 'HH24:MI:SS'), TO_DATE('01:30:15', 'HH24:MI:SS'), 14, NULL, NULL);

-- Event 5: 21K
INSERT INTO entry VALUES (5, 1, TO_DATE('08:03:00', 'HH24:MI:SS'), TO_DATE('11:38:10', 'HH24:MI:SS'), TO_DATE('03:35:10', 'HH24:MI:SS'), 9, NULL, NULL);
INSERT INTO entry VALUES (5, 2, TO_DATE('08:02:30', 'HH24:MI:SS'), TO_DATE('11:57:40', 'HH24:MI:SS'), TO_DATE('03:55:10', 'HH24:MI:SS'), 10, NULL, NULL);
INSERT INTO entry VALUES (5, 3, TO_DATE('08:01:00', 'HH24:MI:SS'), TO_DATE('11:46:40', 'HH24:MI:SS'), TO_DATE('03:45:40', 'HH24:MI:SS'), 15, NULL, NULL);
INSERT INTO entry VALUES (5, 4, NULL, NULL, NULL, 3, NULL, NULL); -- Uncompleted entry


-- Carnival 3 (RM Summer Series Caulfield 2025 - 02/FEB/2025)
-- Event 6: 3K
INSERT INTO entry VALUES (6, 1, TO_DATE('08:31:10', 'HH24:MI:SS'), TO_DATE('08:51:40', 'HH24:MI:SS'), TO_DATE('00:20:30', 'HH24:MI:SS'), 11, NULL, NULL);
INSERT INTO entry VALUES (6, 2, TO_DATE('08:31:05', 'HH24:MI:SS'), TO_DATE('08:56:20', 'HH24:MI:SS'), TO_DATE('00:25:15', 'HH24:MI:SS'), 12, NULL, NULL);
INSERT INTO entry VALUES (6, 3, TO_DATE('08:31:00', 'HH24:MI:SS'), TO_DATE('08:59:15', 'HH24:MI:SS'), TO_DATE('00:28:15', 'HH24:MI:SS'), 10, NULL, NULL);

-- Event 7: 5K
INSERT INTO entry VALUES (7, 1, TO_DATE('08:31:00', 'HH24:MI:SS'), TO_DATE('09:16:45', 'HH24:MI:SS'), TO_DATE('00:45:45', 'HH24:MI:SS'), 13, NULL, 1);
INSERT INTO entry VALUES (7, 2, TO_DATE('08:31:10', 'HH24:MI:SS'), TO_DATE('09:11:20', 'HH24:MI:SS'), TO_DATE('00:40:10', 'HH24:MI:SS'), 14, NULL, 2);

-- Event 8: 10K
INSERT INTO entry VALUES (8, 1, TO_DATE('08:02:00', 'HH24:MI:SS'), TO_DATE('09:07:25', 'HH24:MI:SS'), TO_DATE('01:05:25', 'HH24:MI:SS'), 1, NULL, NULL);
INSERT INTO entry VALUES (8, 2, TO_DATE('08:01:10', 'HH24:MI:SS'), TO_DATE('09:16:35', 'HH24:MI:SS'), TO_DATE('01:15:25', 'HH24:MI:SS'), 4, NULL, NULL);
INSERT INTO entry VALUES (8, 3, TO_DATE('08:01:20', 'HH24:MI:SS'), TO_DATE('09:26:45', 'HH24:MI:SS'), TO_DATE('01:25:25', 'HH24:MI:SS'), 15, NULL, NULL);

-- Event 9: 21K
INSERT INTO entry VALUES (9, 1, TO_DATE('08:01:00', 'HH24:MI:SS'), TO_DATE('10:31:15', 'HH24:MI:SS'), TO_DATE('02:30:15', 'HH24:MI:SS'), 2, NULL, NULL);
INSERT INTO entry VALUES (9, 2, TO_DATE('08:01:05', 'HH24:MI:SS'), TO_DATE('09:49:25', 'HH24:MI:SS'), TO_DATE('01:48:20', 'HH24:MI:SS'), 3, NULL, NULL);
INSERT INTO entry VALUES (9, 3, TO_DATE('08:01:20', 'HH24:MI:SS'), TO_DATE('10:09:30', 'HH24:MI:SS'), TO_DATE('02:08:10', 'HH24:MI:SS'), 5, NULL, NULL);
INSERT INTO entry VALUES (9, 4, TO_DATE('08:01:15', 'HH24:MI:SS'), TO_DATE('10:11:25', 'HH24:MI:SS'), TO_DATE('02:10:10', 'HH24:MI:SS'), 6, NULL, NULL);


-- Carnival 4 (RM Autumn Series Clayton 2025 - 15/MAR/2025)
-- Event 10: 3K
INSERT INTO entry VALUES (10, 1, TO_DATE('08:01:10', 'HH24:MI:SS'), TO_DATE('08:21:25', 'HH24:MI:SS'), TO_DATE('00:20:15', 'HH24:MI:SS'), 2, NULL, 3);
INSERT INTO entry VALUES (10, 2, TO_DATE('08:02:00', 'HH24:MI:SS'), TO_DATE('08:35:20', 'HH24:MI:SS'), TO_DATE('00:33:20', 'HH24:MI:SS'), 14, NULL, 4);

-- Event 11: 42K
INSERT INTO entry VALUES (11, 1, TO_DATE('07:46:00', 'HH24:MI:SS'), TO_DATE('13:01:15', 'HH24:MI:SS'), TO_DATE('05:15:15', 'HH24:MI:SS'), 13, NULL, 1);
INSERT INTO entry VALUES (11, 2, TO_DATE('07:46:10', 'HH24:MI:SS'), TO_DATE('12:34:30', 'HH24:MI:SS'), TO_DATE('04:48:20', 'HH24:MI:SS'), 1, NULL, NULL);


-- Carnival 5 (RM Winter Series Caulfield 2025 - 29/JUN/2025)
-- Event 12: 5K
INSERT INTO entry VALUES (12, 1, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO entry VALUES (12, 2, NULL, NULL, NULL, 13, NULL, NULL);

-- Event 13: 10K
INSERT INTO entry VALUES (13, 1, NULL, NULL, NULL, 14, NULL, 1);
INSERT INTO entry VALUES (13, 2, NULL, NULL, NULL, 3, NULL, 2);

-- Event 14: 21K
INSERT INTO entry VALUES (14, 1, NULL, NULL, NULL, 7, NULL, NULL);
INSERT INTO entry VALUES (14, 2, NULL, NULL, NULL, 11, NULL, 4);
INSERT INTO entry VALUES (14, 3, NULL, NULL, NULL, 4, NULL, 1);


-- =======================================
-- TEAM
-- =======================================
INSERT INTO team VALUES (1, 'Coyotes', TO_DATE('22/SEP/2024', 'DD/MON/YYYY'), 1, 3);
INSERT INTO team VALUES (2, 'Coyotes', TO_DATE('05/OCT/2024', 'DD/MON/YYYY'), 3, 2); -- Same team name, different carnival
INSERT INTO team VALUES (3, 'Speedsters', TO_DATE('05/OCT/2024', 'DD/MON/YYYY'), 4, 1); 
INSERT INTO team VALUES (4, 'Runners Club', TO_DATE('05/OCT/2024', 'DD/MON/YYYY'), 5, 2);
INSERT INTO team VALUES (5, 'Track Stars', TO_DATE('02/FEB/2025', 'DD/MON/YYYY'), 6, 1);


-- =======================================
-- UPDATE ENTRY with team_ids
-- =======================================
-- Update entries for team 1 (Coyotes in Carnival 1)
UPDATE entry SET team_id = 1 
WHERE event_id = 1 AND entry_no IN (1, 2, 3);

-- Update entries for team 2 (Coyotes in Carnival 2)
UPDATE entry SET team_id = 2 
WHERE event_id = 3 AND entry_no IN (1, 2, 3);

-- Update entries for team 3 (Speedsters)
UPDATE entry SET team_id = 3 
WHERE event_id = 4 AND entry_no IN (1, 2);

-- Update entries for team 4 (Runners Club)
UPDATE entry SET team_id = 4 
WHERE event_id = 5 AND entry_no IN (1, 2);

-- Update entries for team 5 (Track Stars)
UPDATE entry SET team_id = 5 
WHERE event_id = 6 AND entry_no IN (1, 2);

-- A single commit based on question requirement 
COMMIT;