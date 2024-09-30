--CREATING TABLES-----------------------------------------------------
CREATE TABLE Patient (
    patient_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    date_of_birth DATE,
    address VARCHAR2(200)
);

CREATE TABLE Doctor (
    doctor_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    specialization VARCHAR2(50),
    contact_info VARCHAR2(100)
);


CREATE TABLE Rooms (
    room_number NUMBER PRIMARY KEY,
    capacity NUMBER,
    type VARCHAR2(50)
);


CREATE TABLE Appointment (
    appointment_id NUMBER PRIMARY KEY,
    date_and_time TIMESTAMP,
    duration NUMBER,
    reason_for_visit VARCHAR2(200),
    patient_id NUMBER REFERENCES Patient(patient_id),
    doctor_id NUMBER REFERENCES Doctor(doctor_id),
    room_number NUMBER REFERENCES Rooms(room_number)
);

-- Insert Data into the Patient Table-------------------------------------------
INSERT INTO Patient (patient_id, name, date_of_birth, address) 
VALUES (1, 'John Doe', TO_DATE('1980-06-15', 'YYYY-MM-DD'), '456 Willow St.');

INSERT INTO Patient (patient_id, name, date_of_birth, address) 
VALUES (2, 'Jane Roe', TO_DATE('1995-09-05', 'YYYY-MM-DD'), '789 Birch Ave.');

INSERT INTO Patient (patient_id, name, date_of_birth, address) 
VALUES (3, 'Emily Clarke', TO_DATE('1978-01-23', 'YYYY-MM-DD'), '321 Pine St.');

INSERT INTO Patient (patient_id, name, date_of_birth, address) 
VALUES (4, 'Michael Brown', TO_DATE('1988-11-12', 'YYYY-MM-DD'), '654 Cedar Rd.');

-- Insert Data into the Doctor Table-----------------------------------------------------
INSERT INTO Doctor (doctor_id, name, specialization, contact_info) 
VALUES (1, 'Dr. Samuel Adams', 'Cardiologist', 'samuel.adams@hospital.com');

INSERT INTO Doctor (doctor_id, name, specialization, contact_info) 
VALUES (2, 'Dr. Lisa Wong', 'Neurologist', 'lisa.wong@hospital.com');

INSERT INTO Doctor (doctor_id, name, specialization, contact_info) 
VALUES (3, 'Dr. Raj Patel', 'Dermatologist', 'raj.patel@hospital.com');

INSERT INTO Doctor (doctor_id, name, specialization, contact_info) 
VALUES (4, 'Dr. Ana Gomez', 'Orthopedist', 'ana.gomez@hospital.com');

-- Insert Data into the Rooms Table------------------------------------------------
INSERT INTO Rooms (room_number, capacity, type) 
VALUES (101, 2, 'Consultation');

INSERT INTO Rooms (room_number, capacity, type) 
VALUES (102, 1, 'Surgery');

INSERT INTO Rooms (room_number, capacity, type) 
VALUES (103, 3, 'Recovery');

INSERT INTO Rooms (room_number, capacity, type) 
VALUES (104, 4, 'Intensive Care');

INSERT INTO Rooms (room_number, capacity, type) 
VALUES (105, 1, 'MRI');



-- Insert Data into the Appointment Table----------------------------------------------
INSERT INTO Appointment (appointment_id, date_and_time, duration, reason_for_visit, patient_id, doctor_id, room_number) 
VALUES (1, TO_TIMESTAMP('2024-09-30 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), 30, 'Routine Heart Checkup', 1, 1, 101);

INSERT INTO Appointment (appointment_id, date_and_time, duration, reason_for_visit, patient_id, doctor_id, room_number) 
VALUES (2, TO_TIMESTAMP('2024-10-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 60, 'Neurological Evaluation', 2, 2, 102);

INSERT INTO Appointment (appointment_id, date_and_time, duration, reason_for_visit, patient_id, doctor_id, room_number) 
VALUES (3, TO_TIMESTAMP('2024-10-01 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 45, 'Skin Allergy Test', 3, 3, 103);

INSERT INTO Appointment (appointment_id, date_and_time, duration, reason_for_visit, patient_id, doctor_id, room_number) 
VALUES (4, TO_TIMESTAMP('2024-10-02 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 90, 'Knee Surgery Consultation', 4, 4, 104);


-- Alter table----
ALTER TABLE Patient 
ADD phone_number VARCHAR2(15);

-- Drop table
DROP TABLE Appointment;

-- Update 
UPDATE Patient 
SET address = '123 New Address St.' 
WHERE patient_id = 1;

-- delete 
DELETE FROM Doctor 
WHERE doctor_id = 3;

-- select 
SELECT * FROM Appointment 
WHERE date_and_time BETWEEN TO_TIMESTAMP('2024-10-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') 
                        AND TO_TIMESTAMP('2024-10-01 23:59:59', 'YYYY-MM-DD HH24:MI:SS');

-- grant 
GRANT SELECT ON Doctor TO carine;

-- revoke 
REVOKE SELECT ON Doctor FROM carine;

-- Save point 
SAVEPOINT savepoint_name;