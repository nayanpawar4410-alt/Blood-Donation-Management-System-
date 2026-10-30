# Blood Donation Management System

Academic prototype using HTML, CSS, JavaScript, Node.js, Express.js and MySQL.

## Modules
1. Donor Management
2. Blood Request Management
3. Authentication
4. Search and Reporting
5. Audit and Administration

## Setup
1. Install Node.js and MySQL (or use an accessible MySQL server).
2. Open a terminal in this folder.
3. Run:
   npm install
4. Create the database by running `database.sql` in MySQL.
5. Copy `.env.example` to `.env` and enter your MySQL settings.
6. Create an admin password hash:
   node create-user.js
7. Insert the generated SQL into MySQL.
8. Start:
   npm start
9. Open `http://localhost:3000`.

## Important
This is an academic prototype. It is not a clinical blood inventory or medical compatibility system. Donor availability does not establish medical eligibility or compatibility; qualified professionals must make final decisions. Use synthetic/test data for college demonstration.
