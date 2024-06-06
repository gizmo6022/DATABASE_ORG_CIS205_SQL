--John Marshall
--Practice Assignment : Advanced Sailor Queries Sub Queries / Inner Queries
--summer 2 2023
--8/23/23



--Find the full names of the students who have taken a CIS course or a History course
SELECT DISTINCT fname, lName
FROM Student
JOIN Registration
ON Student.sid = Registration.sid
JOIN Course
ON Registration.crn = Course.crn
WHERE Course.dept = "CIS" OR  Course.dept = "HIS";

--Find the full names of the students who have taken both a CIS course and a History course

SELECT fname, lName
FROM Student
JOIN Registration
ON Student.sid = Registration.sid
JOIN Course
ON Registration.crn = Course.crn
WHERE Course.dept = "CIS" AND Student.sid IN(
    SELECT Student.sid
FROM Student
JOIN Registration
ON Student.sid = Registration.sid
JOIN Course
ON Registration.crn = Course.crn
WHERE 
      Course.dept = "HIS"
);

--Find the full names of the students who have taken a CIS course but have not taken a History course

SELECT DISTINCT fname, lName
FROM Student
JOIN Registration
ON Student.sid = Registration.sid
JOIN Course
ON Registration.crn = Course.crn
WHERE Course.dept = "CIS" AND NOT Student.sid IN(
    SELECT Student.sid
FROM Student
JOIN Registration
ON Student.sid = Registration.sid
JOIN Course
ON Registration.crn = Course.crn
WHERE 
      Course.dept = "HIS"
);

