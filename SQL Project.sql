use hr;
show tables;
select*from employees;
select first_name, department_id from employees
where last_name="De Haan";
select*from departments;
select department_name from departments
where department_name="Sales";
select first_name, last_name,department_id,salary from employees
where salary>=9700;
select*from employees;
select*from employees 
where hire_date<='1992-01-01';
select employee_id, first_name,job_id,department_id from employees
where department_id not in (20,60,80);
select last_name, phone_number,salary, manager_id from employees
where manager_id=100 and manager_id=102 and manager_id=103;
select first_name, salary from employees
where first_name like '%e';
select last_name,department_id from employees
where last_name like '_i%';
select*from employees 
where last_name like '%l%' 
or last_name like '%j%' 
or last_name like '%h%'
order by salary desc;
select first_name, hire_date,salary, department_id from employees
where first_name not in("A")
order by department_id asc;
select*from employees 
where department_id is null;
select concat(first_name,",",last_name) as full_name , salary from employees
where salary not in (7000) and(15000)
order by full_name asc;
select lower(first_name), upper(last_name), employee_id from employees
where employee_id between 80 and 150;
select*from employees;
select first_name, last_name from employees 
where lower(last_name) like 'king';
select*from employees;
select first_name,last_name, 
concat(left(first_name,1),left(last_name,3),'@oracle.com') as email_address
from employees;
select concat(first_name,"",last_name)
from employees; 
select concat(first_name,last_name,hire_date)
from employees;
select last_name from employees
where length(last_name)>8;
select first_name, last_name,phone_number,
replace(phone_number,'515','815')
as new_phone_number 
from employees;
select*from employees;
select first_name, last_name, salary, 
salary*1.12 as salary_after_raise,
round(salary*1.12) as rounded_salary,
floor(salary*1.12) as floored_salary
from employees;
select first_name,hire_date,
hire_date-interval 10 day as hire_date_10,
hire_date + interval 1 month as hire_date_1,
datediff(curdate(),hire_date) as days_since_hire
from employees;
SELECT 
first_name,last_name,hire_date, 
TIMESTAMPDIFF(MONTH, hire_date, CURDATE()) AS months_worked, 
TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_worked
FROM employees;
select first_name, last_name, hire_date, 
hire_date + interval 1 year as hire_date_1
from employees;
select first_name, last_name, hire_date ,
date_format(hire_date,'%y-01-01') as hire_rounded_year,
date_format(hire_date,'%y-%m-01') as hire_rounded_month
from employees;
select first_name, last_name, hire_date,
day(hire_date) as hire_day,
year(hire_date) as hire_year
from employees;
SELECT 
UPPER(last_name) AS last_name_upper, 
FORMAT(salary, 3) AS formatted_salary, 
DATE_FORMAT(hire_date, '%d/%m/%Y') AS formatted_hire_date
FROM employees
WHERE last_name LIKE 'D%' OR last_name LIKE 'K%';
select first_name,last_name,salary,
coalesce(commission_pct,0) as commision_percentage
from employees;
select*from employees;
SELECT first_name, last_name, salary, 
COALESCE(commission_pct, 'No Commission') AS commission_percentage
FROM employees;
select first_name, last_name, salary, 
case
when salary between 0 and 5000 then 'A'
when salary between 5001 and 15000 then 'B'
when salary between 15001 and 20000 then 'C'
else 'D'
end as salary_grade
from employees;
select employee_id, first_name, last_name, phone_number, department_id
from employees;
select first_name, last_name, hire_date,salary, 	
salary*1.2 as annual_sal
from employees;
SELECT CONCAT(last_name, ' ', first_name) AS FULL_NAME, 
CONCAT(phone_number, ' - ', email) AS CONTACT_DETAILS
FROM employees;
select distinct manager_id from employees;
select concat(last_name,'',job_id) as employee_and_title
from employees;
select first_name as FN, last_name as LN, salary as SAL, 
concat(hire_date,'','HD') as HD
from employees;
select distinct salary 
from employees;
select distinct department_id, job_id
from employees;
SELECT last_name 
FROM employees 
ORDER BY last_name ASC 
LIMIT 1;
select last_name 
from employees
order by last_name desc 
limit 1;
select count(*) as total_rows
from employees;
SELECT COUNT(commission_pct) AS non_null_count
FROM employees;
SELECT COUNT(*) - COUNT(commission_pct) AS null_count
FROM employees;
select salary, 
max(salary),min(salary), avg(salary)
from employees
group by salary;
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;
select department_id, avg(salary) as avg_salary
from employees
where department_id in (50,80)
group by department_id;
select*from employees;
select job_id, count(*) as No_of_Emp
from employees
group by job_id;
select job_id, count(*) as No_of_Emp
from employees
where salary>10000
group by job_id;
SELECT job_id, COUNT(*) AS employee_count
FROM employees
GROUP BY job_id
HAVING COUNT(*) > 2;
select department_id,job_id, avg(salary) as avg_salary
from employees
group by department_id,job_id;
select manager_id, max(salary) as highest_salary
from employees
group by manager_id;
select manager_id, max(salary)
from employees
where salary>10000
group by manager_id;
select job_id, min(salary) 
from employees
where salary > 7000
group by job_id;
select department_id, avg(salary) as avg_salary
from employees
where department_id between 20 and 80 
group by department_id
having avg(salary)>90000;
select first_name, salary
from employees 
where salary> (select salary from employees where employee_id=103);
select * from departments;
select department_id, department_name 
from departments
where location_id =(select location_id from departments where department_id=90);
select last_name, hire_date 
from employees
where hire_date>(select hire_date from employees where employee_id=101);
select*from departments;
select e.first_name, e.last_name, e.department_id
from employees e
join departments d on e.department_id=d.department_id
where d.department_name="Sales";
select department_id, department_name
from departments
where department_name="Toronto";






