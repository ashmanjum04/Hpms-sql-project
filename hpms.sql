-- 1. Patients Table
CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT,
    contact TEXT,
    address TEXT
);

-- 2. Doctors Table
CREATE TABLE Doctors (
    doctor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    specialty TEXT,
    contact TEXT
);

-- 3. Appointments Table
CREATE TABLE Appointments (
    appointment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER,
    doctor_id INTEGER,
    date TEXT,
    time TEXT,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- 4. Rooms Table
CREATE TABLE Rooms (
    room_id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER,
    room_number TEXT,
    admission_date TEXT,
    discharge_date TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- 5. Bills Table
CREATE TABLE Bills (
    bill_id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER,
    amount REAL,
    billing_date TEXT,
    payment_status TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
INSERT INTO Patients (name, age, gender, contact, address) VALUES
('Ravi Kumar', 45, 'Male', '9876543210', 'Hyderabad'),
('Anita Sharma', 30, 'Female', '9876501234', 'Vijayawada'),
('Mohammed Ali', 60, 'Male', '9876123456', 'Guntur'),
('Lakshmi Devi', 25, 'Female', '9876987654', 'Nellore');
INSERT INTO Doctors (name, specialty, contact) VALUES
('Dr. Meena Rao', 'Cardiology', '9988776655'),
('Dr. Prakash Reddy', 'Neurology', '8899001122'),
('Dr. Saira Banu', 'Gynecology', '7766554433'),
('Dr. Kiran Babu', 'Orthopedics', '6655443322');
INSERT INTO Appointments (patient_id, doctor_id, date, time, reason) VALUES
(1, 1, '2025-06-01', '10:00', 'Chest pain'),
(2, 3, '2025-06-02', '11:00', 'Pregnancy checkup'),
(3, 2, '2025-06-03', '09:30', 'Headache'),
(4, 4, '2025-06-04', '14:00', 'Knee pain');
INSERT INTO Rooms (patient_id, room_number, admission_date, discharge_date) VALUES
(1, 'A101', '2025-05-28', '2025-06-03'),
(2, 'B202', '2025-05-29', NULL),
(3, 'C303', '2025-05-25', '2025-05-30');
INSERT INTO Bills (patient_id, amount, billing_date, payment_status) VALUES
(1, 15000.00, '2025-06-03', 'Paid'),
(2, 8000.00, '2025-06-01', 'Unpaid'),
(3, 12000.00, '2025-05-30', 'Paid');

