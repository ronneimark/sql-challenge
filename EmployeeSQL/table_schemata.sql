CREATE  TABLE departments ( 
	dept_no              varchar(5)  NOT NULL ,
	dept_name            varchar(23)  NOT NULL ,
	CONSTRAINT pk_departments_dept_no PRIMARY KEY ( dept_no )
 );

CREATE  TABLE employees ( 
	emp_no               integer  NOT NULL ,
	birth_date           date  NOT NULL ,
	first_name           varchar(18)  NOT NULL ,
	last_name            varchar(20)  NOT NULL ,
	gender               varchar(1)  NOT NULL ,
	hire_date            date  NOT NULL ,
	CONSTRAINT pk_employees_emp_no PRIMARY KEY ( emp_no )
 );

CREATE  TABLE salaries ( 
	emp_no               integer  NOT NULL ,
	salary               integer  NOT NULL ,
	from_date            date  NOT NULL ,
	to_date              date  NOT NULL ,
	CONSTRAINT fk_salaries_employees FOREIGN KEY ( emp_no ) REFERENCES employees( emp_no )  
 );
 
CREATE  TABLE titles ( 
	emp_no               integer  NOT NULL ,
	title                varchar(23)  NOT NULL ,
	from_date            date  NOT NULL ,
	to_date              date  NOT NULL ,
	CONSTRAINT fk_titles_employees FOREIGN KEY ( emp_no ) REFERENCES employees( emp_no )  
 );

CREATE  TABLE dept_emp ( 
	emp_no               integer  NOT NULL ,
	dept_no              varchar(5)  NOT NULL ,
	from_date            date  NOT NULL ,
	to_date              date  NOT NULL
 );

CREATE  TABLE dept_manager ( 
	dept_no              varchar(5)  NOT NULL ,
	emp_no               integer  NOT NULL ,
	from_date            date  NOT NULL ,
	to_date              date  NOT NULL
);

