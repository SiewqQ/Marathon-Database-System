// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-rm-mongo.mongodb.js

// Student ID: 35400145
// Student Name: Tan Siew Quin

// Comments for your marker:

// ===================================================================================
// DO NOT modify or remove any of the comments below (items marked with //)
// ===================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username

use("stan0290");



// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection 
db.team.drop();

// Create collection and insert documents
db.team.insertMany([
  {"_id":1,"carn_name":"RM Spring Series Clayton 2024","carn_date":"22-Sep-2024","team_name":"Coyotes","team_leader":{"name":"Michael Brown","phone":"0434567890","email":"michael.brown@monash.student.edu"},"team_no_of_members":3,"team_members":[{"competitor_name":"James Wilson","competitor_phone":"0412345678","event_type":"5 Km Run","entry_no":1,"starttime":"09:31:00","finishtime":"10:10:30","elapsedtime":"00:39:30"},{"competitor_name":"Michael Brown","competitor_phone":"0434567890","event_type":"5 Km Run","entry_no":3,"starttime":"09:33:00","finishtime":"10:18:45","elapsedtime":"00:45:45"},{"competitor_name":"Sarah Chen","competitor_phone":"0423456789","event_type":"5 Km Run","entry_no":2,"starttime":"09:32:00","finishtime":"10:12:15","elapsedtime":"00:40:15"}]},
  {"_id":2,"carn_name":"RM Spring Series Caulfield 2024","carn_date":"05-Oct-2024","team_name":"Coyotes","team_leader":{"name":"David Taylor","phone":"0456789012","email":"david.taylor@monash.student.edu"},"team_no_of_members":3,"team_members":[{"competitor_name":"Emily Davis","competitor_phone":"0445678901","event_type":"5 Km Run","entry_no":1,"starttime":"09:01:30","finishtime":"09:36:40","elapsedtime":"00:35:10"},{"competitor_name":"Jessica Lee","competitor_phone":"0467890123","event_type":"5 Km Run","entry_no":3,"starttime":"09:01:10","finishtime":"09:46:35","elapsedtime":"00:45:25"},{"competitor_name":"David Taylor","competitor_phone":"0456789012","event_type":"5 Km Run","entry_no":2,"starttime":"09:01:00","finishtime":"09:41:25","elapsedtime":"00:40:25"}]},
  {"_id":3,"carn_name":"RM Spring Series Caulfield 2024","carn_date":"05-Oct-2024","team_name":"Speedsters","team_leader":{"name":"Robert Smith","phone":"0478901234","email":"robert.smith@gmail.com"},"team_no_of_members":2,"team_members":[{"competitor_name":"Robert Smith","competitor_phone":"0478901234","event_type":"10 Km Run","entry_no":1,"starttime":"08:32:00","finishtime":"09:47:20","elapsedtime":"01:15:20"},{"competitor_name":"Amanda Johnson","competitor_phone":"0489012345","event_type":"10 Km Run","entry_no":2,"starttime":"08:31:00","finishtime":"09:31:15","elapsedtime":"01:00:15"}]},
  {"_id":4,"carn_name":"RM Spring Series Caulfield 2024","carn_date":"05-Oct-2024","team_name":"Runners Club","team_leader":{"name":"Olivia Martin","phone":"0401234567","email":"olivia.martin@gmail.com"},"team_no_of_members":2,"team_members":[{"competitor_name":"Daniel Nguyen","competitor_phone":"0490123456","event_type":"21.1 Km Half Marathon","entry_no":1,"starttime":"08:03:00","finishtime":"11:38:10","elapsedtime":"03:35:10"},{"competitor_name":"Olivia Martin","competitor_phone":"0401234567","event_type":"21.1 Km Half Marathon","entry_no":2,"starttime":"08:02:30","finishtime":"11:57:40","elapsedtime":"03:55:10"}]},
  {"_id":5,"carn_name":"RM Summer Series Caulfield 2025","carn_date":"02-Feb-2025","team_name":"Track Stars","team_leader":{"name":"William Anderson","phone":"0411122334","email":"william.anderson@gmail.com"},"team_no_of_members":2,"team_members":[{"competitor_name":"William Anderson","competitor_phone":"0411122334","event_type":"3 Km Community Run/Walk","entry_no":1,"starttime":"08:31:10","finishtime":"08:51:40","elapsedtime":"00:20:30"},{"competitor_name":"Sophia Thomas","competitor_phone":"0422233445","event_type":"3 Km Community Run/Walk","entry_no":2,"starttime":"08:31:05","finishtime":"08:56:20","elapsedtime":"00:25:15"}]}
]);

// List all documents you added
db.team.find();

// // (c)
// // PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// // ENSURE that your query is formatted and has a semicolon
// // (;) at the end of this answer

db.team.find(
  {
    $or: [
      { "team_members.event_type": "5 Km Run" },
      { "team_members.event_type": "10 Km Run" }
    ]
  },
  {
    "_id": 0,
    "carn_date": 1,
    "carn_name": 1,
    "team_name": 1,
    "team_leader.name": 1
  }
);

// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer


// (i) Add new team
db.team.insertOne({
  "_id": 6,
  "carn_name": "RM WINTER SERIES CAULFIELD 2025",
  "carn_date": "29-Jun-2025",
  "team_name": "The Great Runners",
  "team_leader": {
    "name": "Jackson Bull",
    "phone": "0422412524",
    "email": "jackson.bull@student.monash.edu" 
  },
  "team_no_of_members": 1,
  "team_members": [
    {
      "competitor_name": "Jackson Bull",
      "competitor_phone": "0422412524",
      "event_type": "5 Km Run",
      "entry_no": 3, // his entry number within this team's participation in this event
      "starttime": "-", 
      "finishtime": "-",
      "elapsedtime": "-"
    }
  ]
});




// Illustrate/confirm changes made
db.team.find({ "_id": 6 });





// (ii) Add new team member
db.team.updateOne(
  { "_id": 6 }, 
  {
    "$push":
    {"team_members": // Add Steve to the team_members array
        {
            "competitor_name": "Steve Bull",
            "competitor_phone": "0422251427",
            "event_type": "10 Km Run",
            "entry_no": 3, 
            "starttime": "-", 
            "finishtime": "-",
            "elapsedtime": "-"
        }
    },
    "$inc": { "team_no_of_members": 1 } // Increment the member count
  }
);



// Illustrate/confirm changes made
db.team.find({ "_id": 6 });


