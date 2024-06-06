--John Marshall
--Summer 2 2023
--Homework Assignment - Multiple Table Query : Student Course Registration




--List the full names of the students who have taken a CIS 
--course or a History course 


SELECT fname, lName
FROM Student
JOIN Registration
ON Student.sid = Registration.sid
JOIN Course
ON Registration.crn = Course.crn
WHERE Course.dept = "CIS" OR  Course.dept = "HIS";


--List the full names and GPA of 
--the students who have taken a course
SELECT UNIQUE fname, lName, gpa
FROM Student
JOIN Registration
ON Student.sid = Registration.sid;

--List the full names and GPA of the students 
--who have not taken a course


SELECT fname, lName, GPA
FROM Student
LEFT JOIN Registration
ON Student.sid = Registration.sid
Where crn IS NULL;

--List the full names and GPA of the students who 
--have taken a course a 3 credit course 

SELECT fname, lName, gpa
FROM Student
JOIN Registration
ON Student.sid = Registration.sid
JOIN Course
ON Registration.crn = Course.crn
WHERE Course.credits = 3;