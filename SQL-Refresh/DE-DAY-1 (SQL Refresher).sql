create database db;

create table animals(
id INT IDENTITY(1,1) PRIMARY KEY,
name varchar(50),
breed varchar(50),
color varchar(50),
gender varchar(50))

insert into animals(name,breed,color,gender) values ('Bellyflop','Beagle','Brown','Male');
insert into animals(name,breed,color,gender) values ('Snowy','Husky','White','Female');
insert into animals(name,breed,color,gender) values ('Princess','Pomeranian','Black','Female');
insert into animals(name,breed,color,gender) values ('Cricket','Chichua','Brown','Male');
insert into animals(name,breed,color,gender) values ('Spot','Dalmat','Black and White','Male');

select * from animals;

update animals set color = 'Purple' where name = 'Snowy';
update animals set gender = 'Male' where breed = 'Pomeranian';

alter table animals add location varchar(50);

update animals set location = 'Chennai' where id = 1;
update animals set location = 'Benglore' where id = 2;
update animals set location = 'Kerala' where id = 3;
update animals set location = 'Megalaya' where id = 4;
update animals set location = 'Orissa' where id = 5;

delete animals where id = 4;

use db;

create table employee(
			emp_id INT PRIMARY KEY, 
			emp_name varchar(255),
			emp_city varchar(255),
			emp_country varchar(255))

insert into employee (emp_id,emp_name,emp_city,emp_country) values
				(101,'Ram','Varanasi','India'),
				(102,'Akil','Varanasi','India'),
				(103,'Janani','Chennai','India'),
				(104,'Shreja','Patna','India'),
				(105,'Lavanya','Bengalore','India')

select * from employee;

select * from employee where emp_city = 'Varanasi' AND emp_country = 'India';

select * from employee where emp_city IN ('Patna','Chennai');

select * from employee where emp_name NOT LIKE 'R%';

select * from employee where emp_city = 'Bengalore' AND emp_country = 'India';

select * from employee where emp_city LIKE 'C%';

select * from employee where emp_id BETWEEN 103 AND 105;

select * from employee  where emp_id = ALL
				(select emp_id from employee where emp_city = 'Patna');

select * from employee  where emp_id = ANY
				(select emp_id from employee where emp_city = 'Varanasi');

select emp_name from employee where exists (select emp_id from employee where emp_city = 'Varanasi');

select DISTINCT emp_city from employee;

select count(emp_city) as total_count from employee where emp_city = 'Varanasi' 
	group by emp_city;

---- STRING FUNCTIONS

select UPPER(emp_name) as Uppercase_name,LOWER(emp_city) as Lowercase_city from employee;

select LEN(emp_city) as len_city from employee;

select SUBSTRING(emp_city, 1,4) as First4chars from employee;

select CHARINDEX('C', emp_city) AS PositionOfC from employee;

select CHARINDEX('S', emp_name) AS PositionOfS from employee;

select emp_name + ' ' + emp_city AS Address from employee;

select REPLACE(emp_city, 'Bengalore' , 'Bengaluru') AS updatedCity from employee;

SELECT FORMAT(emp_id, '0000') AS FormattedID FROM employee;

------------- MATHEMATICAL FUNCTIONS

alter table employee add salary decimal(10,2);
alter table employee add age int;

select* from employee;

update employee set salary = 90000, age = 45 where emp_id = 101;
update employee set salary = 20000, age = 23 where emp_id = 102;
update employee set salary = 35000, age = 30 where emp_id = 103;
update employee set salary = 45000, age = 29 where emp_id = 104;
update employee set salary = 60000, age = 47 where emp_id = 105;

select emp_id, ABS(salary - 50000) AS SalaryGap from employee;

select  salary, ceiling(salary) AS RoundedUp from employee;

select  salary, floor(salary) AS RoundedUp from employee;

SELECT ROUND(salary, 0) AS RoundedSalary FROM employee;

SELECT ROUND(salary, 2) AS RoundedToTwoDecimalPlaces FROM employee;


------------SUBSTRING
select emp_name, salary from employee where salary > (select avg(salary) from employee);

SELECT emp_name, emp_city
FROM employee
WHERE emp_city IN (
    SELECT emp_city
    FROM Employee
    GROUP BY emp_city
    HAVING COUNT(*) > 1
);

------- JOINS
SELECT DISTINCT E1.emp_name, E1.salary, E1.emp_city
FROM employee E1
JOIN employee E2 ON E1.emp_city = E2.emp_city
WHERE E1.salary > E2.salary;


select E1.emp_name,E1.emp_city,E1.salary 
from employee E1 
where salary >= (
			select max(salary) from employee E2  where E2.emp_city = E1.emp_city);

------ AGGREGATE FUNCTIONS
select count(*) as totalEmployee from employee;

select sum(salary) as TotalSalary from employee;

select emp_id, min(age) as min_age , emp_city from employee group by emp_city,emp_id having min(age) < 30;


create table department (
			department_id int primary key,
			department_name varchar(50)
			);

select * from department;

insert into department (department_id, department_name) values
				(301,'Testing'),
				(302, 'Manufacturing'),
				(303, 'Software Development'),
				(304, 'Marketing'),
				(305, 'Business Advisor')

