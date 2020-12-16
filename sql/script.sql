-- Display count of students having marks in the [70-80]
SELECT COUNT(DISTINCT(stid))
FROM marks
WHERE mark BETWEEN 70 AND 80;
--Display two student names having most even marks
SELECT s.name
FROM marks m
    JOIN students s ON s.stid = m.stid
GROUP by s.stid
ORDER BY MAX(m.mark) DESC
LIMIT 2;
/*
 Display two student names that are worst in Front-End 
 (Assumed that Front-End is any subject that is not related to Java).
 Estimation should be done according to the sum of all relevant marks
 */
SELECT st.name
    FROM marks m
    JOIN subjects su on m.suid = su.suid
    JOIN students st on m.stid = st.stid
WHERE su.subject NOT LIKE '%Java%'
GROUP by st.stid, st.name
ORDER BY SUM(m.mark) ASC
LIMIT 2;
/*
 Display two student names that are best in Back-End 
 (Assumed that Back-End is any subject containing Java). 
 Estimation should be done according to the sum of all relevant marks
 */
SELECT st.name
    FROM marks m
    JOIN subjects su on m.suid = su.suid
    JOIN students st on m.stid = st.stid
WHERE su.subject LIKE '%Java%'
GROUP by st.name
ORDER BY SUM(m.mark) DESC
LIMIT 2;
/*
 Display list of all the marks with counts of their occurrences.
 List should be sorted in the descending order of the occurrences.*/
SELECT mark,
    COUNT(mark)
FROM marks
GROUP BY mark
ORDER BY 2 DESC;