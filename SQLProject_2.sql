USE my_db;

DROP TABLE spartan,course;

CREATE TABLE course(
    courseID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    courseName VARCHAR(50),
    courseDescription VARCHAR(MAX)
)

CREATE TABLE spartan(
    spartanID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    courseID INT NOT NULL 
    FOREIGN KEY(courseID)REFERENCES course ,
    spartanFirstName VARCHAR(50),
    spartanLastName VARCHAR(50),
    spartanUniversity VARCHAR(50)
)

INSERT INTO course(
    courseName, courseDescription
)VALUES(
    'Engineering', 'Learing about cool stuff'
),(
    'Business', 'Learing about Business'
)

INSERT INTO spartan(
    spartanFirstName,
    spartanLastName,
    spartanUniversity
)VALUES(
    1,'Rahib', 'Sayed','University of Westminster'
)