
CREATE TABLE IF NOT EXISTS uct_science.Student (
  StudentID VARCHAR(255) PRIMARY KEY,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  CurrentFaculty VARCHAR(255) NOT NULL,
  ApplicationStatus VARCHAR(255) NOT NULL DEFAULT 'New',
  Funding VARCHAR(255) NOT NULL,
  CareerLevel VARCHAR(255)
);

--DATA FOR STUDENTS--


START TRANSACTION;
INSERT INTO uct_science.Student (StudentID, FirstName, LastName, Email, CurrentFaculty, ApplicationStatus, Funding, CareerLevel) VALUES
('mohmoh010', 'Mohlago', 'Motsinoni', 'mohmoh010@myuct.ac.za', 'Engineering', 'New', 'NSFAS', 'Undergraduate'),
('smijoh020', 'John', 'Smith', 'smijoh020@myuct.ac.za', 'Commerce', 'Pending', 'Private', 'Postgraduate'),
('bramic030', 'Michael', 'Brown', 'bramic030@myuct.ac.za', 'Humanities', 'Accepted', 'Bursary', 'Masters'),
('johjoh040', 'Johan', 'Botha', 'johjoh040@myuct.ac.za', 'Law', 'Rejected', 'NSFAS', 'PhD'),
('mbanok050', 'Nokuthula', 'Mbatha', 'mbanok050@myuct.ac.za', 'Medicine', 'New', 'Private', 'Honours'),
('mbajes060', 'Jessica', 'Mbambo', 'mbajes060@myuct.ac.za', 'Engineering', 'Pending', 'NSFAS', 'Undergraduate'),
('vanali070', 'Alicia', 'van der Merwe', 'vanali070@myuct.ac.za', 'Commerce', 'Accepted', 'Bursary', 'Postgraduate'),
('patmoh080', 'Mohammed', 'Patel', 'patmoh080@myuct.ac.za', 'Humanities', 'New', 'Private', 'Masters'),
('duijan090', 'Janine', 'Duiker', 'duijan090@myuct.ac.za', 'Law', 'Rejected', 'NSFAS', 'Undergraduate'),
('naidav100', 'David', 'Naidoo', 'naidav100@myuct.ac.za', 'Medicine', 'Pending', 'Private', 'PhD'),
('smith011', 'Sipho', 'Mthethwa', 'smith011@myuct.ac.za', 'Engineering', 'Accepted', 'NSFAS', 'Honours'),
('khotho012', 'Thobile', 'Khosa', 'khotho012@myuct.ac.za', 'Commerce', 'New', 'Bursary', 'Undergraduate'),
('leekam013', 'Kamogelo', 'Leeuw', 'leekam013@myuct.ac.za', 'Humanities', 'Pending', 'NSFAS', 'Masters'),
('zulthu014', 'Thulani', 'Zulu', 'zulthu014@myuct.ac.za', 'Law', 'Accepted', 'Private', 'PhD'),
('vanluc015', 'Lucas', 'van Niekerk', 'vanluc015@myuct.ac.za', 'Medicine', 'New', 'Bursary', 'Undergraduate'),
('smithe016', 'Ethan', 'Smith', 'smithe016@myuct.ac.za', 'Engineering', 'Rejected', 'NSFAS', 'Postgraduate'),
('mbalun017', 'Lungi', 'Mbalani', 'mbalun017@myuct.ac.za', 'Commerce', 'Pending', 'Private', 'Honours'),
('dumleo018', 'Lebohang', 'Dumisa', 'dumleo018@myuct.ac.za', 'Humanities', 'Accepted', 'Bursary', 'Masters'),
('patpri019', 'Priya', 'Patel', 'patpri019@myuct.ac.za', 'Law', 'New', 'NSFAS', 'Undergraduate'),
('wilsam020', 'Samuel', 'Wilson', 'wilsam020@myuct.ac.za', 'Medicine', 'Rejected', 'Private', 'PhD');
COMMIT;

CREATE TABLE IF NOT EXISTS uct_science.MatricInformation(
  MatricID INT PRIMARY KEY,
  MatricAverage INT,
  Mathematics INT, 
  PhysicalScience INT,
  InformationTechnology INT,
  StudentID VARCHAR(255) NOT NULL,
  FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

-- DATA FOR MATRIC INFORMATION--
INSERT INTO uct_science.MatricInformation (MatricID, MatricAverage, Mathematics, PhysicalScience, InformationTechnology, StudentID) VALUES
(24984, 75.4, 80, 85, 78, 'mohmoh010'),
(54682, 68.9, 72, 70, 75, 'smijoh020'),
(78623, 82.1, 88, 86, 90, 'bramic030'),
(10293, 65.2, 70, 65, 68, 'johjoh040'),
(56473, 79.5, 82, 80, 85, 'mbanok050'),
(12309, 72.6, 75, 70, 78, 'mbajes060'),
(93785, 85.3, 90, 85, 88, 'vanali070'),
(76543, 77.8, 82, 78, 75, 'patmoh080'),
(13079, 68.2, 70, 65, 72, 'duijan090'),
(98065, 74.9, 78, 75, 80, 'naidav100'),
(45678, 81.7, 85, 82, 88, 'smith011'),
(13009, 73.5, 76, 75, 72, 'khotho012'),
(24680, 79.2, 82, 80, 78, 'leekam013'),
(91765, 87.6, 90, 88, 85, 'zulthu014'),
(54321, 75.8, 78, 76, 80, 'vanluc015'),
(13519, 69.3, 72, 68, 70, 'smithe016'),
(98965, 78.4, 80, 78, 75, 'mbalun017'),
(98865, 84.7, 88, 85, 82, 'dumleo018'),
(99765, 71.5, 75, 70, 72, 'patpri019'),
(90769, 66.8, 70, 65, 68, 'wilsam020');


--DATA FOR STUDENT AND MATRIC INFORMATION--
--------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS uct_science.Majors (
  MajorID INT PRIMARY KEY,
  MajorName VARCHAR(255) NOT NULL,
  Department VARCHAR(255) NOT NULL,
  AdvisorID INT,
  MajorRequirements VARCHAR(255) NOT NULL
);

--DATA FOR UCT MAJORS--


INSERT INTO uct_science.Majors (MajorID, MajorName, Department, AdvisorID, MajorRequirements) VALUES 
(1, 'Introduction to Computer Science', 'Computer Science', 10001, 'CS101'),
(2, 'Data Structures and Algorithms', 'Computer Science', 10001, 'CS102'),
(3, 'Database Systems', 'Computer Science', 10001, 'CS201'),
(4, 'Introduction to Environmental Science', 'Environmental and Geographical Science', 10002, 'ENV101'),
(5, 'Climate Change', 'Environmental and Geographical Science', 10002, 'ENV202'),
(6, 'Environmental Policy and Management', 'Environmental and Geographical Science', 10002, 'ENV201'),
(7, 'Environmental Impact Assessment', 'Environmental and Geographical Science', 10002, 'ENV202'),
(8, 'Calculus I', 'Mathematics And Applied Mathematics', 10003, 'MAT101'),
(9, 'Linear Algebra', 'Mathematics And Applied Mathematics', 10003, 'MAT102'),
(10, 'Calculus II', 'Mathematics And Applied Mathematics', 10003, 'MAT201'),
(11, 'Differential Equations', 'Mathematics And Applied Mathematics', 10003, 'MAT202'),
(12, 'General Chemistry', 'Chemistry', 10004, 'CHEM101'),
(13, 'Organic Chemistry', 'Chemistry', 10004, 'CHEM102'),
(14, 'Inorganic Chemistry', 'Chemistry', 10004, 'CHEM201'),
(15, 'Physical Chemistry', 'Chemistry', 10004, 'CHEM202'),
(16, 'Introduction to Astronomy', 'Astronomy', 10005, 'ASTR101'),
(17, 'Stellar Astrophysics', 'Astronomy', 10005, 'ASTR102'),
(18, 'Galactic Dynamics', 'Astronomy', 10005, 'ASTR201'),
(19, 'Cosmology', 'Astronomy', 10005, 'ASTR202'),
(20, 'Classical Mechanics', 'Physics', 10006, 'PHY101'),
(21, 'Electromagnetism', 'Physics', 10006, 'PHY102'),
(22, 'Quantum Mechanics', 'Physics', 10006, 'PHY201'),
(23, 'Statistical Physics', 'Physics', 10006, 'PHY202'),
(24, 'Introduction to Archaeology', 'Archaeology', 10007, 'ARCH101'),
(25, 'Archaeological Methods', 'Archaeology', 10007, 'ARCH102'),
(26, 'World Archaeology', 'Archaeology', 10007, 'ARCH201'),
(27, 'Archaeological Theory', 'Archaeology', 10007, 'ARCH202'),
(28, 'Introduction to Oceanography', 'Oceanography', 10008, 'OCEAN101'),
(29, 'Marine Biology', 'Oceanography', 10008, 'OCEAN102'),
(30, 'Physical Oceanography', 'Oceanography', 10008, 'OCEAN201'),
(31, 'Ocean Dynamics', 'Oceanography', 10008, 'OCEAN202'),
(32, 'Introduction to Biology', 'Biological Sciences', 10009, 'BIO101'),
(33, 'Cell Biology', 'Biological Sciences', 10009, 'BIO102'),
(34, 'Genetics', 'Biological Sciences', 10009, 'BIO201'),
(35, 'Ecology', 'Biological Sciences', 10009, 'BIO202'),
(36, 'Introduction to Geology', 'Geological Sciences', 10010, 'GEOL101'),
(37, 'Mineralogy', 'Geological Sciences', 10010, 'GEOL102'),
(38, 'Sedimentology', 'Geological Sciences', 10010, 'GEOL201'),
(39, 'Structural Geology', 'Geological Sciences', 10010, 'GEOL202'),
(40, 'Cellular Biology', 'Molecular and Cell Biology', 10011, 'MOBIO101'),
(41, 'Molecular Biology', 'Molecular and Cell Biology', 10011, 'MOBIO102'),
(42, 'Genomics', 'Molecular and Cell Biology', 10011, 'MOBIO201'),
(43, 'Bioinformatics', 'Molecular and Cell Biology', 10011, 'MOBIO202'),
(44, 'Introduction to Statistics', 'Statistical Sciences', 10012, 'STAT101'),
(45, 'Probability Theory', 'Statistical Sciences', 10012, 'STAT102'),
(46, 'Statistical Inference', 'Statistical Sciences', 10012, 'STAT201'),
(47, 'Regression Analysis', 'Statistical Sciences', 10012, 'STAT202');

 

CREATE TABLE IF NOT EXISTS uct_science.AcademicRecord (
  StudentID VARCHAR(255) NOT NULL,
  CourseCode VARCHAR(255) NOT NULL,
  YearTaken INT NOT NULL,
  Semester VARCHAR(255) NOT NULL,
  Grade INT NOT NULL,
  PRIMARY KEY (StudentID, CourseCode, YearTaken, Semester),
  FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
  FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
)

--DATA FOR ACADEMIC RECORD--
---------------------------------------------------------------------------------------------

INSERT INTO uct_science.AcademicRecord (StudentID, CourseCode, YearTaken, Semester, Grade) VALUES
('mohmoh010', 'CS101', 2023, 'first', 85),
('mohmoh010', 'ENV101', 2023, 'first', 78),
('mohmoh010', 'MAT101', 2023, 'second', 92),
('smijoh020', 'CHEM101', 2022, 'first', 91),
('smijoh020', 'ASTR101', 2022, 'first', 85),
('smijoh020', 'BIO101', 2022, 'first', 90),
('bramic030', 'GEOL101', 2023, 'first', 82),
('bramic030', 'STAT101', 2023, 'first', 93),
('johjoh040', 'PHY102', 2023, 'second', 90),
('johjoh040', 'STAT102', 2023, 'first', 85),
('mbajes060', 'ARCH101', 2022, 'first', 89),
('mbajes060', 'BIO101', 2022, 'first', 92),
('vanali070', 'GEOL102', 2022, 'second', 88),
('patmoh080', 'ENV102', 2022, 'second', 88),
('duijan090', 'MAT102', 2023, 'second', 79),
('naidav100', 'BIO101', 2023, 'first', 92);


CREATE TABLE IF NOT EXISTS uct_science.CourseRequirements (
  CourseRequirementsCourseID VARCHAR(255) NOT NULL,
  CourseCode VARCHAR(255) NOT NULL,
  PRIMARY KEY (CourseRequirementsCourseID, CourseCode),
  FOREIGN KEY (CourseRequirementsCourseID) REFERENCES Courses(CourseCode),
  FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
);


CREATE TABLE IF NOT EXISTS uct_science.Courses (
  CourseCode VARCHAR(255) PRIMARY KEY,
  CourseName VARCHAR(255) NOT NULL,
  CourseCredits INT NOT NULL,
  CourseConvenor VARCHAR(255) DEFAULT NULL,
  Lecturer VARCHAR(255) DEFAULT NULL,
  Administrator VARCHAR(255) DEFAULT NULL
 );

 --DATA FOR COURSES--


 INSERT INTO uct_science.Courses(CourseCode, CourseName, CourseCredits, CourseConvenor, Lecturer, Administrator) VALUES
 ('CS101', 'Introduction to Computer Science', 16, 'John Doe', 'Emily Brown', 'Jennifer Anderson'),
('CS102', 'Data Structures and Algorithms', 18, 'Jane Smith', 'Michael Davis', 'Jennifer Anderson'),
('CS201', 'Database Systems', 24, 'John Doe', 'Sarah Wilson', 'Jennifer Anderson'),
('CS202', 'Software Engineering', 16, 'Jane Smith', 'James Martinez', 'Jennifer Anderson'),
('ENV101', 'Introduction to Environmental Science', 16, 'David Johnson', 'Emily Brown', 'Jane Smith'),
('ENV102', 'Climate Change', 18, 'Jane Smith', 'Michael Davis', 'Jane Smith'),
('ENV201', 'Environmental Policy and Management', 24, 'David Johnson', 'Sarah Wilson', 'Jane Smith'),
('ENV202', 'Environmental Impact Assessment', 24, 'Jane Smith', 'James Martinez', 'Jane Smith'),
('MAT101', 'Calculus I', 16, 'David Johnson', 'Emily Brown', 'Matthew Hernandez'),
('MAT102', 'Linear Algebra', 18, 'John Doe', 'Michael Davis', 'Matthew Hernandez'),
('MAT201', 'Calculus II', 24, 'David Johnson', 'Sarah Wilson', 'Matthew Hernandez'),
('MAT202', 'Differential Equations', 16, 'John Doe', 'James Martinez', 'Matthew Hernandez'),
('CHEM101', 'General Chemistry', 16, 'Emily Brown', 'Emily Brown', 'Ashley Young'),
('CHEM102', 'Organic Chemistry', 18, 'Michael Davis', 'Michael Davis', 'Ashley Young'),
('CHEM201', 'Inorganic Chemistry', 24, 'Emily Brown', 'Sarah Wilson', 'Ashley Young'),
('CHEM202', 'Physical Chemistry', 24, 'Michael Davis', 'James Martinez', 'Ashley Young'),
('ASTR101', 'Introduction to Astronomy', 16, 'Michael Davis', 'Emily Brown', 'Nicole Green'),
('ASTR102', 'Stellar Astrophysics', 18, 'Sarah Wilson', 'Michael Davis', 'Nicole Green'),
('ASTR201', 'Galactic Dynamics', 24, 'Michael Davis', 'Sarah Wilson', 'Nicole Green'),
('ASTR202', 'Cosmology', 24, 'Sarah Wilson', 'James Martinez', 'Nicole Green'),
('PHY101', 'Classical Mechanics', 16, 'Sarah Wilson', 'Emily Brown', 'Joshua Wright'),
('PHY102', 'Electromagnetism', 18, 'James Martinez', 'Michael Davis', 'Joshua Wright'),
('PHY201', 'Quantum Mechanics', 24, 'Emily Brown', 'Sarah Wilson', 'Joshua Wright'),
('PHY202', 'Statistical Physics', 24, 'Michael Davis', 'James Martinez', 'Joshua Wright'),
('ARCH101', 'Introduction to Archaeology', 16, 'James Martinez', 'Emily Brown', 'Lauren Garcia'),
('ARCH102', 'Archaeological Methods', 18, 'Emily Brown', 'Michael Davis', 'Lauren Garcia'),
('ARCH201', 'World Archaeology', 24, 'James Martinez', 'Sarah Wilson', 'Lauren Garcia'),
('ARCH202', 'Archaeological Theory', 24, 'Emily Brown', 'James Martinez', 'Lauren Garcia'),
('OCEAN101', 'Introduction to Oceanography', 16, 'Jennifer Anderson', 'Emily Brown', 'Ryan Lewis'),
('OCEAN102', 'Marine Biology', 18, 'David Johnson', 'Michael Davis', 'Ryan Lewis'),
('OCEAN201', 'Physical Oceanography', 24, 'Jennifer Anderson', 'Sarah Wilson', 'Ryan Lewis'),
('OCEAN202', 'Ocean Dynamics', 24, 'David Johnson', 'James Martinez', 'Ryan Lewis'),
('BIO101', 'Introduction to Biology', 16, 'Christopher Taylor', 'Emily Brown', 'Amanda Hall'),
('BIO102', 'Cell Biology', 18, 'Jessica Thomas', 'Michael Davis', 'Amanda Hall'),
('BIO201', 'Genetics', 24, 'Christopher Taylor', 'Sarah Wilson', 'Amanda Hall'),
('BIO202', 'Ecology', 24, 'Jessica Thomas', 'James Martinez', 'Amanda Hall'),
('GEOL101', 'Introduction to Geology', 16, 'Matthew Hernandez', 'Emily Brown', 'Kevin Scott'),
('GEOL102', 'Mineralogy', 18, 'Ashley Young', 'Michael Davis', 'Kevin Scott'),
('GEOL201', 'Sedimentology', 24, 'Matthew Hernandez', 'Sarah Wilson', 'Kevin Scott'),
('GEOL202', 'Structural Geology', 24, 'Ashley Young', 'James Martinez', 'Kevin Scott'),
('MOBIO101', 'Cellular Biology', 16, 'Kevin Scott', 'Emily Brown', 'Nicole Green'),
('MOBIO102', 'Molecular Biology', 18, 'Nicole Green', 'Michael Davis', 'Nicole Green'),
('MOBIO201', 'Genomics', 24, 'Kevin Scott', 'Sarah Wilson', 'Nicole Green'),
('MOBIO202', 'Bioinformatics', 24, 'Nicole Green', 'James Martinez', 'Nicole Green'),
('STAT101', 'Introduction to Statistics', 16, 'Joshua Wright', 'Emily Brown', 'Lauren Garcia'),
('STAT102', 'Probability Theory', 18, 'Lauren Garcia', 'Michael Davis', 'Lauren Garcia'),
('STAT201', 'Statistical Inference', 24, 'Joshua Wright', 'Sarah Wilson', 'Lauren Garcia'),
('STAT202', 'Regression Analysis', 24, 'Lauren Garcia', 'James Martinez', 'Lauren Garcia');




CREATE TABLE IF NOT EXISTS uct_science.CoursePrerequisites (
  PrerequisiteCourseID VARCHAR(255) NOT NULL,
  CourseCode VARCHAR(255) NOT NULL,
  FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
);

--DATA FOR COURSE PREREQUISITES--

INSERT INTO uct_science.CoursePrerequisites (PrerequisiteCourseID, CourseCode) VALUES
('CS101', 'None'),
('CS102', 'CS101'),
('CS201', 'CS102'),
('CS202', 'CS201'),
('ENV101', 'None'),
('ENV102', 'ENV101'),
('ENV201', 'ENV102'),
('ENV202', 'ENV201'),
('MAT101', 'None'),
('MAT102', 'MAT101'),
('MAT201', 'MAT102'),
('MAT202', 'MAT201'),
('CHEM101', 'None'),
('CHEM102', 'CHEM101'),
('CHEM201', 'CHEM102'),
('CHEM202', 'CHEM201'),
('ASTR101', 'None'),
('ASTR102', 'ASTR101'),
('ASTR201', 'ASTR102'),
('ASTR202', 'ASTR201'),
('PHY101', 'None'),
('PHY102', 'PHY101'),
('PHY201', 'PHY102'),
('PHY202', 'PHY201'),
('PHY201', 'MAT101'),
('PHY202', 'MAT201'),
('ARCH101', 'None'),
('ARCH102', 'ARCH101'),
('ARCH201', 'ARCH102'),
('ARCH202', 'ARCH201'),
('OCEAN101', 'None'),
('OCEAN102', 'OCEAN101'),
('OCEAN201', 'OCEAN102'),
('OCEAN202', 'OCEAN201'),
('BIO101', 'None'),
('BIO102', 'BIO101'),
('BIO201', 'BIO102'),
('BIO202', 'BIO201'),
('GEOL101', 'None'),
('GEOL102', 'GEOL101'),
('GEOL201', 'GEOL102'),
('GEOL202', 'GEOL201'),
('MOBIO101', 'None'),
('MOBIO102', 'MOBIO101'),
('MOBIO201', 'MOBIO102'),
('MOBIO202', 'MOBIO201'),
('STAT101', 'None'),
('STAT102', 'STAT101'),
('STAT201','STAT102'),
('STAT202','STAT201');




CREATE TABLE IF NOT EXISTS uct_science.CourseCorequisites (
  CorequisiteCourseID INT NOT NULL,
  CourseCode VARCHAR(255) NOT NULL,
  PRIMARY KEY (CorequisiteCourseID, CourseCode),
  FOREIGN KEY (CorequisiteCourseID) REFERENCES Courses(CourseCode),
  FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
);

--DATA FOR COURSE CORE-REQ--
-------------------------------------------------------------------------------------
INSERT INTO uct_science.CourseCorequisites(PrerequisiteCourseID, CourseCode) VALUES
('CS101', 'None'),
('CS102', 'CS101'),
('CS201', 'CS102'),
('CS202', 'CS201'),
('ENV101', 'None'),
('ENV102', 'ENV101'),
('ENV201', 'ENV102'),
('ENV202', 'ENV201'),
('MAT101', 'None'),
('MAT102', 'MAT101'),
('MAT201', 'MAT102'),
('MAT202', 'MAT201'),
('CHEM101', 'None'),
('CHEM102', 'CHEM101'),
('CHEM201', 'CHEM102'),
('CHEM202', 'CHEM201'),
('ASTR101', 'None'),
('ASTR102', 'ASTR101'),
('ASTR201', 'ASTR102'),
('ASTR202', 'ASTR201'),
('PHY101', 'None'),
('PHY102', 'PHY101'),
('PHY201', 'PHY102'),
('PHY202', 'PHY201'),
('PHY201', 'MAT101'),
('PHY202', 'MAT201'),
('ARCH101', 'None'),
('ARCH102', 'ARCH101'),
('ARCH201', 'ARCH102'),
('ARCH202', 'ARCH201'),
('OCEAN101', 'None'),
('OCEAN102', 'OCEAN101'),
('OCEAN201', 'OCEAN102'),
('OCEAN202', 'OCEAN201'),
('BIO101', 'None'),
('BIO102', 'BIO101'),
('BIO201', 'BIO102'),
('BIO202', 'BIO201'),
('GEOL101', 'None'),
('GEOL102', 'GEOL101'),
('GEOL201', 'GEOL102'),
('GEOL202', 'GEOL201'),
('MOBIO101', 'None'),
('MOBIO102', 'MOBIO101'),
('MOBIO201', 'MOBIO102'),
('MOBIO202', 'MOBIO201'),
('STAT101', 'None'),
('STAT102', 'STAT101'),
('STAT201','STAT102'),
('STAT202','STAT201');




CREATE TABLE IF NOT EXISTS uct_science.Advisors (
  AdvisorID INT PRIMARY KEY,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL UNIQUE,
  Department VARCHAR(255) NOT NULL
);

--DATA FOR STUDENT ADVISORS--

INSERT INTO uct_science.Advisors (AdvisorID, FirstName, LastName, Email, Department) 
VALUES
(10001, 'John', 'Doe', 'john.doe@myuct.ac.za', 'Computer Science'),
(10002, 'Jane', 'Smith', 'jane.smith@myuct.ac.za', 'Environmental and Geographical Science'),
(10003, 'David', 'Johnson', 'david.johnson@myuct.ac.za', 'Mathematics And Applied Mathematics'),
(10004, 'Emily', 'Brown', 'emily.brown@myuct.ac.za', 'Chemistry'),
(10005, 'Michael', 'Davis', 'michael.davis@myuct.ac.za', 'Astronomy'),
(10006, 'Sarah', 'Wilson', 'sarah.wilson@myuct.ac.za', 'Physics'),
(10007, 'James', 'Martinez', 'james.martinez@myuct.ac.za', 'Archaeology'),
(10008, 'Jennifer', 'Anderson', 'jennifer.anderson@myuct.ac.za', 'Oceanography'),
(10009, 'Christopher', 'Taylor', 'christopher.taylor@myuct.ac.za', 'Biological Sciences'),
(10010, 'Jessica', 'Thomas', 'jessica.thomas@myuct.ac.za', 'Geological Sciences'),
(10011, 'Matthew', 'Hernandez', 'matthew.hernandez@myuct.ac.za', 'Molecular and Cell Biology'),
(10012, 'Ashley', 'Young', 'ashley.young@myuct.ac.za', 'Statistical Sciences'),
(10013, 'Nicole', 'Green', 'nicole.green@myuct.ac.za', 'Astronomy'),
(10014, 'Lauren', 'Garcia', 'lauren.garcia@myuct.ac.za', 'Archaeology'),
(10015, 'Ryan', 'Lewis', 'ryan.lewis@myuct.ac.za', 'Oceanography'),
(10016, 'Peter', 'Evans', 'peter.evans@myuct.ac.za', 'Computer Science'),
(10017, 'Laura', 'Rodriguez', 'laura.rodriguez@myuct.ac.za', 'Environmental and Geographical Science'),
(10018, 'Mark', 'Thompson', 'mark.thompson@myuct.ac.za', 'Mathematics And Applied Mathematics'),
(10019, 'Emma', 'White', 'emma.white@myuct.ac.za', 'Chemistry'),
(10020, 'Andrew', 'Clark', 'andrew.clark@myuct.ac.za', 'Physics'),
(10021, 'Karen', 'Hill', 'karen.hill@myuct.ac.za', 'Biological Sciences'),
(10022, 'Daniel', 'Carter', 'daniel.carter@myuct.ac.za', 'Geological Sciences'),
(10023, 'Rachel', 'Morris', 'rachel.morris@myuct.ac.za', 'Molecular and Cell Biology'),
(10024, 'Scott', 'Wright', 'scott.wright@myuct.ac.za', 'Statistical Sciences');


