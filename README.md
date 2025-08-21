Gym-Management-System
Relational database in Oracle SQL to manage gym members, instructors, payments, workouts, and health records.

Gym Management System 🏋️‍♂️
📌 Overview
This project is a Gym Management System built using Oracle SQL to manage members, instructors, payments, workout plans, and health records.
It follows 3NF normalization to reduce redundancy and ensure data integrity using primary/foreign keys, unique constraints, and check conditions.

📂 Features
Manage customers, members, and instructors with separate linked tables.
Track payments, membership start/end dates, and health records.
Assign and monitor workout plans and workouts.
Sample SQL queries for filtering, joining, and reporting.
Fully normalized to 3NF for efficiency and data consistency.
🛠 Database Design
7+ Tables: Customer, Member, Instructor, Payment, Workout_Plan, Workout, Health_Records
Constraints: PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, NOT NULL
Relationships:
One-to-One: Customer ↔ Member, Customer ↔ Instructor
One-to-Many: Member ↔ Payment, Member ↔ Workout_Plan
Many-to-Many via linking tables
🚀 How to Run
Install Oracle SQL Developer or use Oracle Live SQL.
Open gym_management_system.sql in your SQL environment.
Run the script to create tables and insert sample data.
Execute queries to test functionality.
