DROP TABLE IF EXISTS patients;

CREATE TABLE
    patients (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        date_of_birth DATE NOT NULL
    );

DROP TABLE IF EXISTS invoices;

CREATE TABLE
    invoices (
        id SERIAL PRIMARY KEY,
        total_amount DECIMAL(8, 2) NOT NULL,
        gererated_at TIMESTAMP NOT NULL,
        payed_at TIMESTAMP NOT NULL,
        medical_history_id INT NOT NULL
    );

DROP TABLE IF EXISTS medical_histories;

CREATE TABLE
    medical_histories (
        id SERIAL PRIMARY KEY,
        admitted_at TIMESTAMP NOT NULL,
        patient_id INT NOT NULL,
        status VARCHAR(100) NOT NULL
    );

DROP TABLE IF EXISTS invoice_items;

CREATE TABLE
    invoice_items (
        id SERIAL PRIMARY KEY,
        unit_price DECIMAL(8, 2) NOT NULL,
        quantity INTEGER NOT NULL,
        total_price DECIMAL(8, 2) NOT NULL,
        invoice_id INTEGER NOT NULL,
        treatment_id INTEGER NOT NULL
    );

DROP TABLE IF EXISTS treatments;

CREATE TABLE
    treatments (
        id SERIAL PRIMARY KEY,
        type VARCHAR(100) NOT NULL,
        name VARCHAR(100) NOT NULL
    );

DROP TABLE IF EXISTS treatment_histories;

CREATE TABLE
    treatment_histories (
        med_history_id INTEGER NOT NULL,
        treatment_id INTEGER NOT NULL,
        CONSTRAINT PK_Treatment_histories PRIMARY KEY (med_history_id, treatment_id)
    );

ALTER TABLE treatment_histories
ADD FOREIGN KEY (med_history_id) REFERENCES medical_histories (id);

ALTER TABLE treatment_histories
ADD FOREIGN KEY (treatment_id) REFERENCES treatments (id);