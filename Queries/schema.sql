create table departments(
        dept_no VARCHAR(4) not null,
        dept_name VARCHAR (40) not null,
	    primary key(dept_no),
	    unique(dept_name)
	);
create table employees(
       emp_no int  not null,
	   birth_date date not null,
	   first_name varchar not null ,
	   last_name varchar not null ,
	   gender varchar not null, 
	   hire_date date not null, 
	primary key (emp_no)

);
 
create table dept_manager(
       dept_no varchar(4) not null,
       emp_no int not null , 
       from_date date not null ,
       to_date date not null ,
  foreign key (emp_no) references employees(emp_no),
  foreign key(dept_no) references departments(dept_no)
	   
 );
	   
  CREATE TABLE salaries (
       emp_no INT NOT NULL,
       salary INT NOT NULL,
       from_date DATE NOT NULL,
       to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
  
);

create table titles(
     emp_no int not null , 
     title varchar not null,
     from_date date not null , 
     to_date date not null,
  foreign key(emp_no) references employees(emp_no)
     
);

create table dept_emp(
    emp_no int not null , 
    dept_no varchar not null ,
    from_date date not null , 
   to_date date not null ,
foreign key (dept_no)references departments (dept_no),
foreign key(emp_no) references employees(emp_no)

);