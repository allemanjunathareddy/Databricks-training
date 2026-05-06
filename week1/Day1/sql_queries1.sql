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

    -- 1
    SELECT * FROM Employee;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #2**

    -- 2
    SELECT name, salary FROM Employee;

| name        | salary  |
| ----------- | ------- |
| John Doe    | 50000.0 |
| Jane Smith  | 60000.0 |
| Bob Brown   | 80000.0 |
| Alice Blue  | 45000.0 |
| Charlie P.  | 50000.0 |
| David Green | 70000.0 |
| Eve Black   | 55000.0 |
| Frank White | 48000.0 |
| Grace Kelly | 65000.0 |
| Hannah Lee  | 53000.0 |

---
**Query #3**

    -- 3
    SELECT * FROM Employee WHERE age > 30;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |

---
**Query #4**

    -- 4
    SELECT name FROM Employee;

| name        |
| ----------- |
| John Doe    |
| Jane Smith  |
| Bob Brown   |
| Alice Blue  |
| Charlie P.  |
| David Green |
| Eve Black   |
| Frank White |
| Grace Kelly |
| Hannah Lee  |

---
**Query #5**

    -- 5
    SELECT * FROM Employee WHERE department_id = 2;

| emp_id | name       | age | salary  | department_id | hire_date  |
| ------ | ---------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith | 34  | 60000.0 | 2             | 2019-07-23 |
| 5      | Charlie P. | 29  | 50000.0 | 2             | 2019-12-01 |

---
**Query #6**

    -- 6
    SELECT * FROM Employee WHERE name LIKE 'J%';

| emp_id | name       | age | salary  | department_id | hire_date  |
| ------ | ---------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe   | 28  | 50000.0 | 1             | 2020-01-15 |
| 2      | Jane Smith | 34  | 60000.0 | 2             | 2019-07-23 |

---
**Query #7**

    -- 7
    SELECT * FROM Employee WHERE name LIKE '%e';

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #8**

    -- 8
    SELECT * FROM Employee WHERE name LIKE '%a%';

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #9**

    -- 9
    SELECT * FROM Employee WHERE name LIKE '_____';

There are no results to be displayed.

---
**Query #10**

    -- 10
    SELECT * FROM Employee WHERE name LIKE '_a%';

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #11**

    -- 11
    SELECT * FROM Employee WHERE YEAR(hire_date) = 2020;

| emp_id | name       | age | salary  | department_id | hire_date  |
| ------ | ---------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe   | 28  | 50000.0 | 1             | 2020-01-15 |
| 10     | Hannah Lee | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #12**

    -- 12
    SELECT * FROM Employee
    WHERE hire_date >= CURDATE() - INTERVAL 1 YEAR;

There are no results to be displayed.

---
**Query #13**

    -- 13
    SELECT * FROM Employee
    WHERE hire_date < '2019-01-01';

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

---
**Query #14**

    -- 14
    SELECT * FROM Employee
    WHERE hire_date BETWEEN '2021-01-01' AND '2021-12-31';

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |

---
**Query #15**

    -- 15
    SELECT * FROM Employee
    WHERE hire_date >= CURDATE() - INTERVAL 2 YEAR;

There are no results to be displayed.

---
**Query #16**

    -- 16
    SELECT SUM(salary) FROM Employee;

| SUM(salary) |
| ----------- |
| 576000.0    |

---
**Query #17**

    -- 17
    SELECT AVG(salary) FROM Employee;

| AVG(salary) |
| ----------- |
| 57600.0     |

---
**Query #18**

    -- 18
    SELECT MAX(salary) FROM Employee;

| MAX(salary) |
| ----------- |
| 80000.0     |

---
**Query #19**

    -- 19
    SELECT department_id, COUNT(*)
    FROM Employee
    GROUP BY department_id;

| department_id | COUNT(*) |
| ------------- | -------- |
|               | 1        |
| 1             | 3        |
| 2             | 2        |
| 3             | 2        |
| 4             | 2        |

---
**Query #20**

    -- 20
    SELECT department_id, AVG(salary)
    FROM Employee
    GROUP BY department_id;

| department_id | AVG(salary) |
| ------------- | ----------- |
|               | 48000.0     |
| 1             | 65000.0     |
| 2             | 55000.0     |
| 3             | 50000.0     |
| 4             | 61500.0     |

---
**Query #21**

    -- 21
    SELECT department_id, SUM(salary)
    FROM Employee
    GROUP BY department_id;

| department_id | SUM(salary) |
| ------------- | ----------- |
|               | 48000.0     |
| 1             | 195000.0    |
| 2             | 110000.0    |
| 3             | 100000.0    |
| 4             | 123000.0    |

---
**Query #22**

    -- 22
    SELECT department_id, AVG(salary)
    FROM Employee
    GROUP BY department_id;

| department_id | AVG(salary) |
| ------------- | ----------- |
|               | 48000.0     |
| 1             | 65000.0     |
| 2             | 55000.0     |
| 3             | 50000.0     |
| 4             | 61500.0     |

---
**Query #23**

    -- 23
    SELECT department_id, COUNT(*)
    FROM Employee
    GROUP BY department_id;

| department_id | COUNT(*) |
| ------------- | -------- |
|               | 1        |
| 1             | 3        |
| 2             | 2        |
| 3             | 2        |
| 4             | 2        |

---
**Query #24**

    -- 24
    SELECT department_id, MAX(salary)
    FROM Employee
    GROUP BY department_id;

| department_id | MAX(salary) |
| ------------- | ----------- |
|               | 48000.0     |
| 1             | 80000.0     |
| 2             | 60000.0     |
| 3             | 55000.0     |
| 4             | 70000.0     |

---
**Query #25**

    -- 25
    SELECT department_id
    FROM Employee
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1;

| department_id |
| ------------- |
| 1             |

---

[View on DB Fiddle](https://www.db-fiddle.com/)