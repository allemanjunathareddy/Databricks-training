**Schema (MySQL v5.7)**

    -- Create Department table
    CREATE TABLE Department (
        department_id INT PRIMARY KEY,
        name VARCHAR(50) NOT NULL
    );
    
    -- Create Employee table
    CREATE TABLE Employee (
        emp_id INT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        age INT,
        salary DECIMAL(10, 2),
        department_id INT,
        hire_date DATE,
        FOREIGN KEY (department_id) REFERENCES Department(department_id)
    );
    
    -- Create Project table
    CREATE TABLE Project (
        project_id INT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        department_id INT,
        FOREIGN KEY (department_id) REFERENCES Department(department_id)
    );
    
    -- Insert data into Department table
    INSERT INTO Department (department_id, name) VALUES
    (1, 'IT'),
    (2, 'HR'),
    (3, 'Finance'),
    (4, 'Marketing');
    
    -- Insert data into Employee table
    INSERT INTO Employee (emp_id, name, age, salary, department_id, hire_date) VALUES
    (1, 'John Doe', 28, 50000.00, 1, '2020-01-15'),
    (2, 'Jane Smith', 34, 60000.00, 2, '2019-07-23'),
    (3, 'Bob Brown', 45, 80000.00, 1, '2018-02-12'),
    (4, 'Alice Blue', 25, 45000.00, 3, '2021-03-22'),
    (5, 'Charlie P.', 29, 50000.00, 2, '2019-12-01'),
    (6, 'David Green', 38, 70000.00, 4, '2022-05-18'),
    (7, 'Eve Black', 40, 55000.00, 3, '2021-08-30');
    
    -- Insert data into Project table
    INSERT INTO Project (project_id, name, department_id) VALUES
    (1, 'Project Alpha', 1),
    (2, 'Project Beta', 2),
    (3, 'Project Gamma', 1),
    (4, 'Project Delta', 3),
    (5, 'Project Epsilon', 4),
    (6, 'Project Zeta', 4),
    (7, 'Project Eta', 3);
    
    
    -- Insert additional data into Department table (if needed)
    -- No additional departments needed for this data set
    
    -- Insert additional data into Employee table to test edge cases for joins and nested queries
    INSERT INTO Employee (emp_id, name, age, salary, department_id, hire_date) VALUES
    (8, 'Frank White', 32, 48000.00, NULL, '2021-07-10'),  -- Employee without a department
    (9, 'Grace Kelly', 27, 65000.00, 1, '2018-11-13'),
    (10, 'Hannah Lee', 30, 53000.00, 4, '2020-02-25');
    
    -- Insert additional data into Project table to test edge cases for joins
    INSERT INTO Project (project_id, name, department_id) VALUES
    (8, 'Project Theta', 1),
    (9, 'Project Iota', NULL);  -- Project without a department

---

**Query #1**

    -- 26
    SELECT department_id 
    FROM Employee 
    GROUP BY department_id 
    HAVING COUNT(*) > 2;

| department_id |
| ------------- |
| 1             |

---
**Query #2**

    -- 27
    SELECT department_id 
    FROM Employee 
    GROUP BY department_id 
    HAVING AVG(salary) > 55000;

| department_id |
| ------------- |
| 1             |
| 4             |

---
**Query #3**

    -- 28
    SELECT department_id 
    FROM Employee 
    GROUP BY department_id 
    HAVING COUNT(*) > 0;

| department_id |
| ------------- |
|               |
| 1             |
| 2             |
| 3             |
| 4             |

---
**Query #4**

    -- 29
    SELECT department_id 
    FROM Employee 
    GROUP BY department_id 
    HAVING AVG(salary) < 100000;

| department_id |
| ------------- |
|               |
| 1             |
| 2             |
| 3             |
| 4             |

---
**Query #5**

    -- 30
    SELECT department_id 
    FROM Employee 
    GROUP BY department_id 
    HAVING MIN(salary) > 70000;

There are no results to be displayed.

---
**Query #6**

    -- 31
    SELECT * FROM Employee ORDER BY salary ASC;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

---
**Query #7**

    -- 32
    SELECT * FROM Employee ORDER BY age DESC;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |

---
**Query #8**

    -- 33
    SELECT * FROM Employee ORDER BY hire_date ASC;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |

---
**Query #9**

    -- 34
    SELECT * FROM Employee 
    ORDER BY department_id, salary;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |

---
**Query #10**

    -- 35
    SELECT * FROM Employee 
    ORDER BY salary DESC LIMIT 3;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

---
**Query #11**

    -- 36
    SELECT e.name, d.name 
    FROM Employee e
    JOIN Department d 
    ON e.department_id = d.department_id;

| name        | name      |
| ----------- | --------- |
| John Doe    | IT        |
| Bob Brown   | IT        |
| Grace Kelly | IT        |
| Jane Smith  | HR        |
| Charlie P.  | HR        |
| Alice Blue  | Finance   |
| Eve Black   | Finance   |
| David Green | Marketing |
| Hannah Lee  | Marketing |

---
**Query #12**

    -- 37
    SELECT p.name, d.name 
    FROM Project p
    JOIN Department d 
    ON p.department_id = d.department_id;

| name            | name      |
| --------------- | --------- |
| Project Alpha   | IT        |
| Project Gamma   | IT        |
| Project Theta   | IT        |
| Project Beta    | HR        |
| Project Delta   | Finance   |
| Project Eta     | Finance   |
| Project Epsilon | Marketing |
| Project Zeta    | Marketing |

---
**Query #13**

    -- 38
    SELECT e.name, p.name 
    FROM Employee e
    JOIN Project p 
    ON e.department_id = p.department_id;

| name        | name            |
| ----------- | --------------- |
| John Doe    | Project Alpha   |
| Bob Brown   | Project Alpha   |
| Grace Kelly | Project Alpha   |
| Jane Smith  | Project Beta    |
| Charlie P.  | Project Beta    |
| John Doe    | Project Gamma   |
| Bob Brown   | Project Gamma   |
| Grace Kelly | Project Gamma   |
| Alice Blue  | Project Delta   |
| Eve Black   | Project Delta   |
| David Green | Project Epsilon |
| Hannah Lee  | Project Epsilon |
| David Green | Project Zeta    |
| Hannah Lee  | Project Zeta    |
| Alice Blue  | Project Eta     |
| Eve Black   | Project Eta     |
| John Doe    | Project Theta   |
| Bob Brown   | Project Theta   |
| Grace Kelly | Project Theta   |

---
**Query #14**

    -- 39
    SELECT e.* 
    FROM Employee e
    LEFT JOIN Department d 
    ON e.department_id = d.department_id
    WHERE d.department_id IS NULL;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |

---
**Query #15**

    -- 40
    SELECT d.* 
    FROM Department d
    LEFT JOIN Employee e 
    ON d.department_id = e.department_id
    WHERE e.emp_id IS NULL;

There are no results to be displayed.

---
**Query #16**

    -- 41
    SELECT * FROM Employee 
    WHERE emp_id NOT IN 
    (SELECT DISTINCT emp_id FROM Employee WHERE department_id IS NOT NULL);

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |

---
**Query #17**

    -- 42
    SELECT d.name, COUNT(e.emp_id)
    FROM Department d
    LEFT JOIN Employee e 
    ON d.department_id = e.department_id
    GROUP BY d.name;

| name      | COUNT(e.emp_id) |
| --------- | --------------- |
| Finance   | 2               |
| HR        | 2               |
| IT        | 3               |
| Marketing | 2               |

---
**Query #18**

    -- 43
    SELECT d.name
    FROM Department d
    LEFT JOIN Employee e 
    ON d.department_id = e.department_id
    WHERE e.emp_id IS NULL;

There are no results to be displayed.

---
**Query #19**

    -- 44
    SELECT * FROM Employee 
    WHERE department_id = 
    (SELECT department_id FROM Employee WHERE name = 'John Doe');

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

---
**Query #20**

    -- 45
    SELECT department_id
    FROM Employee
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1;

| department_id |
| ------------- |
| 1             |

---
**Query #21**

    -- 46
    SELECT * FROM Employee 
    WHERE salary = (SELECT MAX(salary) FROM Employee);

| emp_id | name      | age | salary  | department_id | hire_date  |
| ------ | --------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown | 45  | 80000.0 | 1             | 2018-02-12 |

---
**Query #22**

    -- 47
    SELECT * FROM Employee 
    WHERE salary > (SELECT AVG(salary) FROM Employee);

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

---
**Query #23**

    -- 48
    SELECT * FROM Employee 
    WHERE salary = (SELECT MAX(salary) FROM Employee);

| emp_id | name      | age | salary  | department_id | hire_date  |
| ------ | --------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown | 45  | 80000.0 | 1             | 2018-02-12 |

---
**Query #24**

    -- 49
    SELECT department_id
    FROM Employee
    GROUP BY department_id
    ORDER BY COUNT(*) DESC
    LIMIT 1;

| department_id |
| ------------- |
| 1             |

---
**Query #25**

    -- 50
    SELECT e.*
    FROM Employee e
    JOIN (
        SELECT department_id, AVG(salary) avg_sal
        FROM Employee GROUP BY department_id
    ) d
    ON e.department_id = d.department_id
    WHERE e.salary > d.avg_sal;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

---
**Query #26**

    -- 51
    SELECT * FROM Employee 
    WHERE age > ALL (
        SELECT age FROM Employee WHERE department_id = 2
    );

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

---
**Query #27**

    -- 52
    SELECT d.name
    FROM Department d
    JOIN Employee e ON d.department_id = e.department_id
    GROUP BY d.name
    HAVING AVG(e.salary) > 50000;

| name      |
| --------- |
| HR        |
| IT        |
| Marketing |

---
**Query #28**

    -- 53
    SELECT department_id
    FROM Employee
    GROUP BY department_id
    HAVING COUNT(*) >= 2;

| department_id |
| ------------- |
| 1             |
| 2             |
| 3             |
| 4             |

---
**Query #29**

    -- 54
    SELECT * FROM Employee 
    WHERE department_id IN (
        SELECT department_id FROM Project GROUP BY department_id HAVING COUNT(*) >= 2
    );

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #30**

    -- 55
    SELECT name FROM Employee WHERE YEAR(hire_date) = 2020;

| name       |
| ---------- |
| John Doe   |
| Hannah Lee |

---
**Query #31**

    -- 56
    SELECT name FROM Employee WHERE salary > 50000;

| name        |
| ----------- |
| Jane Smith  |
| Bob Brown   |
| David Green |
| Eve Black   |
| Grace Kelly |
| Hannah Lee  |

---
**Query #32**

    -- 57
    SELECT * FROM Employee 
    ORDER BY department_id, salary DESC;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #33**

    -- 58
    SELECT * FROM Employee 
    WHERE salary > 50000 
    AND YEAR(hire_date) = 2020;

| emp_id | name       | age | salary  | department_id | hire_date  |
| ------ | ---------- | --- | ------- | ------------- | ---------- |
| 10     | Hannah Lee | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #34**

    -- 59
    SELECT department_id
    FROM Employee
    GROUP BY department_id
    HAVING COUNT(*) > 2;

| department_id |
| ------------- |
| 1             |

---
**Query #35**

    -- 60
    SELECT * FROM Employee e
    WHERE salary > (
        SELECT AVG(salary)
        FROM Employee
        WHERE department_id = e.department_id
    );

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

---
**Query #36**

    -- 61
    SELECT * FROM Employee 
    WHERE age IN (
        SELECT age FROM Employee GROUP BY age HAVING COUNT(*) > 1
    );

There are no results to be displayed.

---
**Query #37**

    -- 62
    SELECT e.name, COUNT(p.project_id)
    FROM Employee e
    JOIN Project p ON e.department_id = p.department_id
    GROUP BY e.name;

| name        | COUNT(p.project_id) |
| ----------- | ------------------- |
| Alice Blue  | 2                   |
| Bob Brown   | 3                   |
| Charlie P.  | 1                   |
| David Green | 2                   |
| Eve Black   | 2                   |
| Grace Kelly | 3                   |
| Hannah Lee  | 2                   |
| Jane Smith  | 1                   |
| John Doe    | 3                   |

---
**Query #38**

    -- 63
    SELECT e.*
    FROM Employee e
    JOIN (
        SELECT department_id, MAX(salary) max_sal
        FROM Employee GROUP BY department_id
    ) d
    ON e.department_id = d.department_id
    WHERE e.salary = d.max_sal;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

---
**Query #39**

    -- 64
    SELECT name FROM Employee 
    WHERE age > (SELECT AVG(age) FROM Employee);

| name        |
| ----------- |
| Jane Smith  |
| Bob Brown   |
| David Green |
| Eve Black   |

---

[View on DB Fiddle](https://www.db-fiddle.com/)