CREATE DATABASE ss8;
USE ss8;

CREATE TABLE  Departments(
dept_id int primary key auto_increment,
dept_name varchar(100) not null ,
location varchar(100) 
);

CREATE TABLE Employees(
emp_id  int primary key auto_increment,
emp_name varchar(100) not null,
gender int default(1),
birth_date date ,
salary decimal(10,2),
dept_id int ,
foreign key (dept_id) references departments(dept_id)
);

CREATE TABLE Projects(
project_id int primary key auto_increment,
project_name varchar(150) not null,
emp_id int,
foreign key (emp_id) references employees(emp_id),
start_date date default(current_date()),
end_date date 
);

-- Câu 2:
ALTER TABLE employees
ADD COLUMN email VARCHAR(100) unique;

ALTER TABLE projects 
add constraint check_date check(end_date > start_date);

ALTER TABLE projects 
modify project_name varchar(200);

-- Câu 3:
insert into Departments(dept_id,dept_name,location)
value ('1','IT','Ha Noi'), ('2','HR','HCM'), ('3','Marketing','Da Nang');

insert into Employees
value ('1','Nguyen Van A','1','1990-01-15','1500','1','a@gmail.com'),
 ('2','Tran Thi B','0','1995-05-20','1200','1','b@gmail.com'),
 ('3','Le Minh C','1','1988-10-10','2000','2','c@gmail.com'),
 ('4','Pham Thi D ','0','1992-12-05','1800','3','d@gmail.com');
 
 insert into projects
 value ('101','Website Redesign','1','2024-01-01','2024-06-01'),
 ('102','Recruitment System','3','2024-02-01','2024-08-01'),
 ('103','Marketing Campaign','4','2024-03-01',NULL);

update employees
set salary = salary +200
where dept_id =1;

update projects
set end_date = '2024-12-31'
where end_date is Null;

delete from projects 
where start_date < '2024-02-01';


-- Câu 4:

-- Hiển thị emp_name, salary và dept_name của từng nhân viên

select emp.emp_name ,emp.salary,dept.dept_name 
from employees emp join  Departments dept on emp.dept_id = emp.dept_id;

-- Lấy thông tin 2 nhân viên có mức lương cao nhất, sắp xếp giảm dần

select emp.emp_id,emp.emp_name,emp_gender,emp.email,emp.birth_date,emp.salary
from employees emp 
ORDER BY salary desc 
limit 2;

-- Tìm những nhân viên có mức lương cao hơn mức lương trung bình của toàn công ty
select emp.emp_name ,emp.email
from employees emp  
where salary >(select avg(salary)
			   from employees emp);





