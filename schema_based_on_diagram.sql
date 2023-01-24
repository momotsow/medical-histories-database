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
        medical_history_id INT NOT NULL,
        FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
    );

DROP INDEX IF EXISTS invoices_medical_history_id_asc;

CREATE INDEX invoices_medical_history_id_asc ON invoices (medical_history_id ASC);

DROP TABLE IF EXISTS medical_histories;

CREATE TABLE
    medical_histories (
        id SERIAL PRIMARY KEY,
        admitted_at TIMESTAMP NOT NULL,
        patient_id INT NOT NULL,
        status VARCHAR(100) NOT NULL,
        FOREIGN KEY (patient_id) REFERENCES patients(id)
    );

DROP INDEX IF EXISTS medical_histories_patient_id_asc;

CREATE INDEX medical_histories_patient_id_asc ON medical_histories (patient_id ASC);


DROP TABLE IF EXISTS treatments;

CREATE TABLE
    treatments (
        id SERIAL PRIMARY KEY,
        type VARCHAR(100) NOT NULL,
        name VARCHAR(100) NOT NULL
    );

DROP TABLE IF EXISTS treatment_histories;

DROP TABLE IF EXISTS invoice_items;

CREATE TABLE
    invoice_items (
        id SERIAL PRIMARY KEY,
        unit_price DECIMAL(8, 2) NOT NULL,
        quantity INTEGER NOT NULL,
        total_price DECIMAL(8, 2) NOT NULL,
        invoice_id INTEGER NOT NULL,
        treatment_id INTEGER NOT NULL,
        FOREIGN KEY (invoice_id) REFERENCES invoices(id),
        FOREIGN KEY (treatment_id) REFERENCES treatments(id)
    );

DROP INDEX IF EXISTS invoice_items_invoice_id_asc;

CREATE INDEX invoice_items_invoice_id_asc ON invoice_items (invoice_id ASC);

DROP INDEX IF EXISTS invoice_items_treatment_id_asc;

CREATE INDEX invoice_items_treatment_id_asc ON invoice_items (treatment_id ASC);

CREATE TABLE
    treatment_histories (
        med_history_id INTEGER NOT NULL,
        treatment_id INTEGER NOT NULL,
        CONSTRAINT PK_Treatment_histories PRIMARY KEY (med_history_id, treatment_id),
        FOREIGN KEY (med_history_id) REFERENCES medical_histories(id),
        FOREIGN KEY (treatment_id) REFERENCES treatments(id)
    );

DROP INDEX IF EXISTS th_med_history_id_asc;

CREATE INDEX th_med_history_id_asc ON treatment_histories (med_history_id ASC);

DROP INDEX IF EXISTS th_treatment_id_asc;

CREATE INDEX th_treatment_id_asc ON treatment_histories (treatment_id ASC);