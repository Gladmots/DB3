
CREATE TABLE uct_science.Student (
  StudentID INT PRIMARY KEY,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  E-mail VARCHAR(255) NOT NULL,
  CurrentFaculty VARCHAR(255) NOT NULL,
  ApplicationStatus VARCHAR(255) NOT NULL DEFAULT 'New',
  Funding VARCHAR(255) NOT NULL,
  AdvisorID INT,
  CareerLevel VARCHAR(255),
  ExpectedGraduationDate DATE,
  FOREIGN KEY (AdvisorID) REFERENCES Advisors(AdvisorID)
  
);

CREATE TABLE uct_science.Majors (
  MajorID INT PRIMARY KEY,
  MajorName VARCHAR(255) NOT NULL,
  Department VARCHAR(255) NOT NULL,
  MajorRequirements VARCHAR(255) NOT NULL
);

CREATE TABLE uct_science.AcademicRecord (
  StudentID INT NOT NULL,
  CourseID INT NOT NULL,
  YearTaken INT NOT NULL,
  Semester VARCHAR(255) NOT NULL,
  Grade VARCHAR(255),
  PRIMARY KEY (StudentID, CourseID, YearTaken, Semester),
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
  FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE uct_science.CourseRequirements (
  MajorID INT NOT NULL,
  CourseID INT NOT NULL,
  PRIMARY KEY (MajorID, CourseID),
  FOREIGN KEY (MajorID) REFERENCES Majors(MajorID),
  FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE uct_science.Courses (
  CourseID INT PRIMARY KEY,
  CourseCode VARCHAR(255) NOT NULL UNIQUE,
  CourseName VARCHAR(255) NOT NULL,
  DepartmentID INT NOT NULL,
  CourseConvenor VARCHAR(255) DEFAULT NULL,
  Lecturer VARCHAR(255) DEFAULT NULL,
  Administrator VARCHAR(255) DEFAULT NULL,
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);


CREATE TABLE uct_science.CoursePrerequisites (
  PrerequisiteCourseID INT NOT NULL,
  CourseID INT NOT NULL,
  PRIMARY KEY (PrerequisiteCourseID, CourseID),
  FOREIGN KEY (PrerequisiteCourseID) REFERENCES Courses(CourseID),
  FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE uct_science.CourseCorequisites (
  CorequisiteCourseID INT NOT NULL,
  CourseID INT NOT NULL,
  PRIMARY KEY (CorequisiteCourseID, CourseID),
  FOREIGN KEY (CorequisiteCourseID) REFERENCES Courses(CourseID),
  FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
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
