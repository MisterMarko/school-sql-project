-- 1. Basis-Daten einfügen (Das hattest du schon)
INSERT INTO Skill (skill_name) VALUES ('Java');
INSERT INTO Skill (skill_name) VALUES ('Project Management');
INSERT INTO Skill (skill_name) VALUES ('C#');
INSERT INTO Skill (skill_name) VALUES ('Linux Pro');

INSERT INTO Department (dept_name) VALUES ('Software Development');
INSERT INTO Department (dept_name) VALUES ('AI Development');
INSERT INTO Department (dept_name) VALUES ('Human Resources');

INSERT INTO Employee (lastname, firstname, birth_date) VALUES ('Trkulja', 'Marko', TO_DATE('2008-02-13', 'YYYY-MM-DD'));
INSERT INTO Employee (lastname, firstname, birth_date) VALUES ('Doe', 'Jane', TO_DATE('1990-11-15', 'YYYY-MM-DD'));
INSERT INTO Employee (lastname, firstname, birth_date) VALUES ('Smith', 'Johnny', TO_DATE('1982-03-30', 'YYYY-MM-DD'));

-- 2. Verknüpfungen erstellen (DAS IST WICHTIG!)
-- Marko Trkulja -> Java
INSERT INTO EmployeeSkill (employee_id, skill_id, certificate)
SELECT e.employee_id, s.skill_id, 'OCP Java 17'
FROM Employee e, Skill s
WHERE e.lastname = 'Trkulja' AND s.skill_name = 'Java';

-- Jane Doe -> C#
INSERT INTO EmployeeSkill (employee_id, skill_id, certificate)
SELECT e.employee_id, s.skill_id, NULL
FROM Employee e, Skill s
WHERE e.lastname = 'Doe' AND s.skill_name = 'C#';

-- Johnny Smith -> Linux Pro
INSERT INTO EmployeeSkill (employee_id, skill_id, certificate)
SELECT e.employee_id, s.skill_id, 'LPIC-2'
FROM Employee e, Skill s
WHERE e.lastname = 'Smith' AND s.skill_name = 'Linux Pro';

-- Marko Trkulja -> C# (Zweiter Skill)
INSERT INTO EmployeeSkill (employee_id, skill_id, certificate)
SELECT e.employee_id, s.skill_id, NULL
FROM Employee e, Skill s
WHERE e.lastname = 'Trkulja' AND s.skill_name = 'C#';

-- 3. Abteilungs-Bedarf verknüpfen
-- Software Development braucht Java
INSERT INTO DeptReqSkill (department_id, skill_id)
SELECT d.department_id, s.skill_id
FROM Department d, Skill s
WHERE d.dept_name = 'Software Development' AND s.skill_name = 'Java';

-- Software Development braucht C#
INSERT INTO DeptReqSkill (department_id, skill_id)
SELECT d.department_id, s.skill_id
FROM Department d, Skill s
WHERE d.dept_name = 'Software Development' AND s.skill_name = 'C#';

-- AI Development braucht Linux Pro
INSERT INTO DeptReqSkill (department_id, skill_id)
SELECT d.department_id, s.skill_id
FROM Department d, Skill s
WHERE d.dept_name = 'AI Development' AND s.skill_name = 'Linux Pro';

-- Speichern
COMMIT;