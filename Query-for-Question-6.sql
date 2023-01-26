SELECT 
    CASE 
        WHEN grade < 8 THEN 'NULL' 
        ELSE name 
    END as 'Name',
    grade, 
    value
FROM 
    (SELECT 
        students.name, 
        students.value, 
        (SELECT grade FROM notes WHERE students.value BETWEEN min_value AND max_value) as grade
     FROM 
        students) as student_grades
WHERE 
    grade >= 8
ORDER BY 
    grade DESC, 
    CASE 
        WHEN grade < 8 THEN grade 
        ELSE name 
    END;