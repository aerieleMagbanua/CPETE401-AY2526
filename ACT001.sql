-- Problem 1: Online Bookstore Inventory

CREATE TABLE authors (
    auth_id INT PRIMARY KEY,
    auth_firstname VARCHAR(100) NOT NULL,
    auth_lastname VARCHAR(100) NOT NULL,
    auth_biography TEXT,
    auth_dob DATE
);

CREATE TABLE publishers (
    pub_id INT PRIMARY KEY,
    pub_name VARCHAR(100) NOT NULL UNIQUE,
    pub_countryOrigin VARCHAR(100) NOT NULL
);

CREATE TABLE books (
    books_id INT PRIMARY KEY,
    books_title VARCHAR(100) NOT NULL,
    books_isbn VARCHAR(13) NOT NULL UNIQUE,
    books_publication_date DATE NOT NULL,
    books_price DECIMAL(10, 2) NOT NULL CHECK (books_price > 0),
    pub_id INT,
    FOREIGN KEY (pub_id) REFERENCES publishers(pub_id) ON DELETE SET NULL
    -- FOREIGN KEY (parent_id) REFERENCES parent_table(id)
);

CREATE TABLE books_authors (
    books_id INT,
    auth_id INT,
    PRIMARY KEY (books_id, auth_id),
    FOREIGN KEY (books_id) REFERENCES books(books_id) ON DELETE CASCADE,
    FOREIGN KEY (auth_id) REFERENCES authors(auth_id) ON DELETE CASCADE 
);

-- Problem 2: Clinical Appointment System

CREATE TABLE patients (
    patients_id INT PRIMARY KEY,
    patients_fname VARCHAR(100) NOT NULL,
    patients_lname VARCHAR(100) NOT NULL,
    patients_date_of_birth DATE NOT NULL,
    patients_phone_number INT UNIQUE,
    patient_record DATE
);

CREATE TABLE doctors (
    doctors_id INT PRIMARY KEY,
    doctors_fname VARCHAR(100) NOT NULL,
    doctors_lname VARCHAR(100) NOT NULL,
    doctors_med_specialty VARCHAR(100) NOT NULL,
    doctors_year_license YEAR  
);

CREATE TABLE appoinments (
    appointments_id INT PRIMARY KEY,
    patients_id INT,
    doctors_id INT,
    appointments_date DATETIME NOT NULL,
    appointments_visit_reason TEXT,
    appointments_status ENUM('Scheduled', 'Completed', 'Canceled', 'No-Show'), 
    FOREIGN KEY (patients_id) REFERENCES  patients(patients_id) ON DELETE CASCADE,
    FOREIGN KEY (doctors_id) REFERENCES  doctors(doctors_id) ON DELETE CASCADE
);


-- Problem 3: University Course Catalog

CREATE TABLE departments (
    departments_id INT PRIMARY KEY,
    departments_name VARCHAR(100) NOT NULL UNIQUE,
    departments_loc VARCHAR(100)
);

CREATE TABLE courses (
    courses_id INT PRIMARY KEY,
    courses_code VARCHAR(100) UNIQUE,
    courses_title VARCHAR(100),
    courses_credits SMALLINT CHECK (courses_credits > 0),
    departments_id INT,
    prerequisite_course_id INT,
    FOREIGN KEY (departments_id) REFERENCES departments(departments_id) ON DELETE CASCADE,
    FOREIGN KEY (prerequisite_course_id) REFERENCES courses(courses_id) ON DELETE SET NULL
);
