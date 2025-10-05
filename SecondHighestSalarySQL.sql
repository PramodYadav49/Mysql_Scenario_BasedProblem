-- We want the second highest salary in each department from the employees table:

-- +--------+-----------------+------------+----------+------------+-----------------------------+
-- | emp_id | name            | department | salary   | hire_date  | email                       |
-- +--------+-----------------+------------+----------+------------+-----------------------------+
-- |      1 | Rohan Sharma    | IT         | 60000.00 | 2023-03-15 | rohan.sharma@company.com    |
-- |      2 | Aman Verma      | IT         | 55000.00 | 2022-11-10 | aman.verma@company.com      |
-- |      3 | Priya Singh     | HR         | 45000.00 | 2023-05-01 | priya.singh@company.com     |
-- |      4 | Nisha Patel     | Sales      | 40000.00 | 2022-09-20 | nisha.patel@company.com     |
-- |      5 | Vikas Gupta     | Finance    | 70000.00 | 2021-12-05 | vikas.gupta@company.com     |
-- |      6 | Ritu Yadav      | Marketing  | 52000.00 | 2023-01-18 | ritu.yadav@company.com      |
-- |      7 | Arjun Mehta     | IT         | 64000.00 | 2022-08-12 | arjun.mehta@company.com     |
-- |      8 | Neha Chauhan    | HR         | 47000.00 | 2023-02-22 | neha.chauhan@company.com    |
-- |      9 | Sanjay Kumar    | Sales      | 42000.00 | 2021-10-30 | sanjay.kumar@company.com    |
-- |     10 | Kavita Bansal   | Finance    | 68000.00 | 2022-07-16 | kavita.bansal@company.com   |
-- |     11 | Deepak Joshi    | Support    | 38000.00 | 2023-04-25 | deepak.joshi@company.com    |
-- |     12 | Anjali Mishra   | IT         | 58000.00 | 2021-11-05 | anjali.mishra@company.com   |
-- |     13 | Rohit Sinha     | Sales      | 45000.00 | 2023-06-11 | rohit.sinha@company.com     |
-- |     14 | Meena Tiwari    | HR         | 48000.00 | 2022-12-03 | meena.tiwari@company.com    |
-- |     15 | Karan Jain      | Marketing  | 55000.00 | 2023-05-20 | karan.jain@company.com      |
-- |     16 | Sneha Agarwal   | Finance    | 72000.00 | 2021-08-09 | sneha.agarwal@company.com   |
-- |     17 | Vivek Rana      | IT         | 62000.00 | 2023-02-14 | vivek.rana@company.com      |
-- |     18 | Pooja Nair      | Support    | 40000.00 | 2022-10-08 | pooja.nair@company.com      |
-- |     19 | Gaurav Malhotra | Sales      | 46000.00 | 2021-09-15 | gaurav.malhotra@company.com |
-- |     20 | Tanya Kapoor    | Marketing  | 51000.00 | 2022-06-22 | tanya.kapoor@company.com    |
-- +--------+-----------------+------------+----------+------------+-----------------------------+

-- 1. Using SubQuery
-- Inner Query Find the maximum Salary  Outer Query find salary less than maximum salary 

SELECT name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (SELECT MAX(salary) FROM employees)
);

-- +-------------+----------+
-- | name        | salary   |
-- +-------------+----------+
-- | Vikas Gupta | 70000.00 |
-- +-------------+----------+



-- 2. using Order by, Limit , Offset
-- In this Query First Order By Decresing order than Limit meaning need only one element offset 1 meaning it will skip 1 element


 SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- +-------------+----------+
-- | name        | salary   |
-- +-------------+----------+
-- | Vikas Gupta | 70000.00 |
-- +-------------+----------+


-- Find Second Higest salary From each Department


SELECT *
FROM (
    SELECT 
        name,
        department,
        salary,
        DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM employees
) AS ranked
WHERE rnk = 2;




