
CREATE TABLE departments (
    departments_id INT,
    departments_name VARCHAR(100),
    departments_loc VARCHAR(100)
);

CREATE TABLE courses (
    courses_id INT,
    courses_code VARCHAR(100),
    courses_title TEXT,
    courses_credits INT
);


CREATE TABLE patients (
    patients_book_id INT,
    patients_fname VARCHAR (100),
    patients_lname VARCHAR (100),
    patients_date_of_birth DATE,
    patients_phone_number INT,
    patient_record DATE
);

CREATE TABLE doctors (
    doctors_id INT,
    doctors_fname VARCHAR(100),
    doctors_lname VARCHAR(100),
    doctors_med_specialty VARCHAR(100),
    doctors_year_license DATE 
);

CREATE TABLE appoinments (
    appointments_id INT,
    appointments_date DATETIME,
    appointments_visit_reason TEXT,
    appointments_status ENUM('Scheduled', 'Completed', 'Canceled', 'No-Show')
);

CREATE TABLE authors (
    auth_id INT PRIMARY KEY,
    auth_firstname VARCHAR(100),
    auth_lastname VARCHAR(100),
    auth_bigraphy TEXT,
    auth_dob DATE
);

CREATE TABLE publishers (
    pub_id INT,
    pub_name VARCHAR(100),
    pub_country VARCHAR (100)
);

CREATE TABLE books (
    books_id INT,
    books_isbn VARCHAR (100),
    books_publication_date DATE,
    books_price DECIMAL (10, 2)
);
