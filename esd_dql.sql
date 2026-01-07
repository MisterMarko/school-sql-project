SELECT * FROM Employee;

SELECT * FROM Skill;

SELECT * FROM EmployeeSkill;

SELECT * FROM DEPARTMENT;

SELECT * FROM DeptReqSkill;



--Which skills are required by each department ?
INSERT INTO Result (question, value1, value2, value3)
SELECT  d.DEPT_NAME , s.SKILL_NAME,  NULL 
FROM DEPARTMENT d 
JOIN DEPTREQSKILL d2 ON d.DEPARTMENT_ID = d2.DEPARTMENT_ID
JOIN SKILL s ON d2.SKILL_ID = s.SKILL_ID;













