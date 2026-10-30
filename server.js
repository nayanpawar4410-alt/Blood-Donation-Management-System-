const express = require("express");
const session = require("express-session");
const path = require("path");
require("dotenv").config();

const authRoutes = require("./routes/auth");
const donorRoutes = require("./routes/donors");
const requestRoutes = require("./routes/requests");
const reportRoutes = require("./routes/reports");
const adminRoutes = require("./routes/admin");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(session({
  secret: process.env.SESSION_SECRET || "change-me",
  resave: false,
  saveUninitialized: false,
  cookie: { maxAge: 1000 * 60 * 60 }
}));

app.use(express.static(path.join(__dirname, "public")));

app.use("/api/auth", authRoutes);
app.use("/api/donors", donorRoutes);
app.use("/api/requests", requestRoutes);
app.use("/api/reports", reportRoutes);
app.use("/api/admin", adminRoutes);

app.get("/api/health", (req, res) => res.json({ status: "OK" }));

app.get("/", (req, res) => res.sendFile(path.join(__dirname, "public", "index.html")));

app.listen(PORT, () => console.log(`Server running at http://localhost:${PORT}`));