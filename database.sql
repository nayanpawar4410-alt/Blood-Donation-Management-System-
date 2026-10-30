CREATE DATABASE IF NOT EXISTS blood_donation_db;
USE blood_donation_db;

CREATE TABLE IF NOT EXISTS users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('admin','staff') NOT NULL DEFAULT 'staff',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS donors (
  donor_id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(120),
  blood_group VARCHAR(5) NOT NULL,
  city_area VARCHAR(100) NOT NULL,
  last_donation_date DATE,
  consent_to_contact BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS blood_requests (
  request_id INT AUTO_INCREMENT PRIMARY KEY,
  requester_name VARCHAR(100) NOT NULL,
  contact_phone VARCHAR(20) NOT NULL,
  blood_group VARCHAR(5) NOT NULL,
  units_requested INT NOT NULL,
  facility_name VARCHAR(150) NOT NULL,
  area VARCHAR(100) NOT NULL,
  urgency ENUM('Normal','Urgent','Emergency') DEFAULT 'Normal',
  status ENUM('Open','Contacting','Fulfilled','Cancelled') DEFAULT 'Open',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS donations (
  donation_id INT AUTO_INCREMENT PRIMARY KEY,
  donor_id INT NOT NULL,
  donation_date DATE NOT NULL,
  units INT DEFAULT 1,
  FOREIGN KEY (donor_id) REFERENCES donors(donor_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS audit_logs (
  log_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NULL,
  action VARCHAR(100) NOT NULL,
  entity_type VARCHAR(50),
  entity_id INT NULL,
  details TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL
);