DROP TABLE IF EXISTS patients;

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL
);

DROP TABLE IF EXISTS invoices;

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL(8,2),
    gererated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT
);

DROP TABLE IF EXISTS medical_histories;

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(100)
);