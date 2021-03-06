/*
Lab 7
Philip Burggraf
*/

--1.  
SELECT COURSE.COURSE_NO, DESCRIPTION, NVL(REVENUE, 0) AS "TOTAL REVENUE PER COURSE"
FROM STUDENT.COURSE LEFT JOIN STUDENT.COURSE_REVENUE
    ON COURSE.COURSE_NO = COURSE_REVENUE.COURSE_NO
ORDER BY 3;

--2. 
SELECT COURSE.COURSE_NO, DESCRIPTION, NVL(REVENUE, 0) AS "TOTAL REVENUE PER COURSE"
FROM STUDENT.COURSE_REVENUE RIGHT JOIN STUDENT.COURSE
    ON COURSE_REVENUE.COURSE_NO = COURSE.COURSE_NO
ORDER BY 3;

--3.
SELECT COURSE.COURSE_NO, DESCRIPTION, REVENUE
FROM STUDENT.COURSE JOIN STUDENT.COURSE_REVENUE
    ON COURSE.COURSE_NO = COURSE_REVENUE.COURSE_NO
ORDER BY REVENUE DESC;

--4.
    SELECT INSTRUCTOR_ID AS "INSTRUCTORS NOT TEACHING"
    FROM STUDENT.INSTRUCTOR
MINUS
    SELECT INSTRUCTOR_ID
    FROM STUDENT.SECTION
ORDER BY 1 DESC;

--5.
SELECT DESCRIPTION, COST, PREREQUISITE
FROM STUDENT.COURSE
WHERE (COST > 1100) AND (PREREQUISITE >= 25 AND PREREQUISITE <= 80) AND DESCRIPTION LIKE '%s';

--6.
SELECT COST, COUNT(*) AS "TOTAL COURSES"
FROM STUDENT.COURSE
GROUP BY COST
ORDER BY 2 DESC;

--7.
SELECT COURSE_NO, DESCRIPTION
FROM STUDENT.COURSE
WHERE (LENGTH(DESCRIPTION) >= 10) AND (LENGTH(DESCRIPTION) < 16)
ORDER BY COURSE_NO;

--8.
SELECT TO_CHAR(SYSDATE, 'MM/DD/YYYY') AS "FORMATTED TODAY'S DATE"
FROM DUAL;

--9.
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY HH:MI:SS') AS "FORMATTED TODAY'S DATE"
FROM DUAL;

--10.
SELECT TO_CHAR(SYSDATE, 'DY MON DD, YYYY') AS "FORMATTED TODAY'S DATE"
FROM DUAL;

--11.
SELECT MAX(COST) AS "HIGHEST COST"
FROM STUDENT.COURSE;

--12.
SELECT TO_CHAR(MAX(COST), '$999,999') AS "HIGHEST COST"
FROM STUDENT.COURSE;

--13.   HELP - couldn't figure out the median
SELECT MIN(SALARY) AS "MINIMUM", MAX(SALARY) AS "MAXIMUM", AVG(SALARY) AS "AVERAGE", (2000 + 1000) / 2 AS "MEDIAN"
FROM STUDENT.EMPLOYEE;

--14.
SELECT MIN(SALARY) + MAX(SALARY) AS "MIN PLIS MAX"
FROM STUDENT.EMPLOYEE;

--15.
SELECT EMPLOYEE_ID, NAME, TITLE
FROM STUDENT.EMPLOYEE
WHERE TITLE IN ('Manager', 'Analyst')
ORDER BY TITLE DESC;

--16.
SELECT LAST_NAME AS "SOUNDS LIKE ARCHER"
FROM STUDENT.STUDENT
WHERE SOUNDEX(LAST_NAME) = SOUNDEX('ARCHER');

--17.
SELECT EMPLOYER, COUNT(STUDENT_ID)
FROM STUDENT.STUDENT
GROUP BY EMPLOYER
ORDER BY 2 DESC;

--18.
SELECT EMPLOYER, COUNT(STUDENT_ID)
FROM STUDENT.STUDENT
GROUP BY EMPLOYER
HAVING COUNT(STUDENT_ID) > 7
ORDER BY 2 DESC;

--19.
SELECT STUDENT_ID, LAST_NAME || ', ' || FIRST_NAME AS "LAST, FIRST"
FROM STUDENT.STUDENT
ORDER BY 1
FETCH FIRST 10 ROWS ONLY;

--20.
SELECT MIDTERM_GRADE, FINALEXAM_GRADE, QUIZ_GRADE, COALESCE(MIDTERM_GRADE, FINALEXAM_GRADE, QUIZ_GRADE, 0)AS "DEFAULT OF 0"
FROM STUDENT.GRADE_SUMMARY;