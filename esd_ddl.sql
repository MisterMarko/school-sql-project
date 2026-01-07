CREATE TABLE Employee (
    employee_id NUMBER GENERATED ALWAYS AS IDENTITY,
    lastname VARCHAR2(50) NOT NULL,
    firstname VARCHAR2(50) NOT NULL,
    birth_date DATE,
    CONSTRAINT pk_employee PRIMARY KEY (employee_id)
);
CREATE TABLE Skill (
    skill_id NUMBER GENERATED ALWAYS AS IDENTITY,
    skill_name VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_skill PRIMARY KEY (skill_id)
);
CREATE TABLE Department (
    department_id NUMBER GENERATED ALWAYS AS IDENTITY,
    dept_name VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_department PRIMARY KEY (department_id)
);
CREATE TABLE EmployeeSkill (
    employee_id NUMBER NOT NULL,
    skill_id NUMBER NOT NULL,
    certificate VARCHAR2(100),
    CONSTRAINT pk_employee_skill PRIMARY KEY (employee_id, skill_id),
    CONSTRAINT fk_es_employee FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    CONSTRAINT fk_es_skill FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
);
CREATE TABLE DeptReqSkill (
    department_id NUMBER NOT NULL,
    skill_id NUMBER NOT NULL,
    CONSTRAINT pk_dept_req_skill PRIMARY KEY (department_id, skill_id),
    CONSTRAINT fk_drs_department FOREIGN KEY (department_id) REFERENCES Department(department_id),
    CONSTRAINT fk_drs_skill FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
);
CREATE TABLE Result (
    question varchar2(100),
    value1 varchar2(100),
    value2 varchar2(100),
    value3 varchar2(100)
);	
