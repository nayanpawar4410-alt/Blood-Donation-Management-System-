const bcrypt = require("bcryptjs");
const username = process.argv[2] || "admin";
const password = process.argv[3] || "admin123";
(async()=>{const hash=await bcrypt.hash(password,10);console.log(`INSERT INTO users (username,password_hash,role) VALUES ('${username}','${hash}','admin');`);})();