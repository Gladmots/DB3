
CREATE TABLE uct_science.Student (
  StudentID INT PRIMARY KEY,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  E-mail VARCHAR(255) NOT NULL,
  CurrentFaculty VARCHAR(255) NOT NULL,
  ApplicationStatus VARCHAR(255) NOT NULL DEFAULT 'New',
  Funding VARCHAR(255) NOT NULL,
  CareerLevel VARCHAR(255),
  FOREIGN KEY (AdvisorID) REFERENCES Advisors(AdvisorID)
  
);

CREATE TABLE uct_science.MatricInformation(
  MatricID INT PRIMARY KEY,
  MatricAverage INT,
  Mathematics INT,
  PhysicalScience INT,
  InformationTechnology INT
);

CREATE TABLE uct_science.Majors (
  MajorID INT PRIMARY KEY,
  MajorName VARCHAR(255) NOT NULL,
  Department VARCHAR(255) NOT NULL,
  AdvisorID INT,
  MajorRequirements VARCHAR(255) NOT NULL
);

CREATE TABLE uct_science.AcademicRecord (
  StudentID INT NOT NULL,
  CourseCode INT NOT NULL,
  YearTaken INT NOT NULL,
  Semester VARCHAR(255) NOT NULL,
  Grade INT NOT NULL,
  PRIMARY KEY (StudentID, CourseCode, YearTaken, Semester),
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
  FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
);

CREATE TABLE uct_science.CourseRequirements (
  CourseRequirementsCourseID INT NOT NULL,
  CourseCode INT NOT NULL,
  PRIMARY KEY (CourseRequirementsCourseID, CourseCode),
  FOREIGN KEY (CourseRequirementsCourseID) REFERENCES Courses(CourseCode),
  FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
);

CREATE TABLE uct_science.Courses (
  CourseCode VARCHAR(255) PRIMARY KEY,
  CourseName VARCHAR(255) NOT NULL,
  CourseCredits INT,
  CourseConvenor VARCHAR(255) DEFAULT NULL,
  Lecturer VARCHAR(255) DEFAULT NULL,
  Administrator VARCHAR(255) DEFAULT NULL,
  
);


CREATE TABLE uct_science.CoursePrerequisites (
  PrerequisiteCourseID INT NOT NULL,
  CourseCode INT NOT NULL,
  PRIMARY KEY (PrerequisiteCourseID, CourseCode),
  FOREIGN KEY (PrerequisiteCourseID) REFERENCES Courses(CourseCode),
  FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
);

CREATE TABLE uct_science.CourseCorequisites (
  CorequisiteCourseID INT NOT NULL,
  CourseCode INT NOT NULL,
  PRIMARY KEY (CorequisiteCourseID, CourseCode),
  FOREIGN KEY (CorequisiteCourseID) REFERENCES Courses(CourseCode),
  FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
);

CREATE TABLE uct_science.Advisors (
  AdvisorID INT PRIMARY KEY,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL UNIQUE,
  DepartmentID INT,
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);


-- Add additional tables as needed for your specific requirements
