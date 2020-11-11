#1. Создать VIEW на основе запросов, которые вы сделали в ДЗ к уроку 3.
create view employWithMaxSalary as
	select *
from employees e
where e.emp_no = (select x.emp_no
                  from (
                           select e.emp_no, max(s.salary) as max_salary
                           from salaries as s
                                    join employees e on e.emp_no = s.emp_no
                           group by e.emp_no
                           order by max_salary desc
                           limit 1) as x);

#2. Создать функцию, которая найдет менеджера по имени и фамилии.
#Ослабление проверки недетеминированных функций
set global log_bin_trust_function_creators = 1 ;


create function find_Manager_id(firstName varchar(50), secondName varchar(50)) returns int
    begin
        declare result_id INT;
        select e.emp_no into result_id from dept_manager
        left join employees e on e.emp_no = dept_manager.emp_no
        where e.first_name = firstName and e.last_name = secondName;
        return result_id;
    end



#Margareta Markovitch
#110022

#3. Создать триггер, который при добавлении нового сотрудника будет выплачивать ему вступительный бонус, занося запись об этом в таблицу salary.

delimiter $$
create trigger employees.add_employes
    after insert
    on employees
    for each row
begin
    declare id int;
    select emp_no into id from employees order by emp_no desc limit 1;
    insert into salaries(emp_no, salary, from_date, to_date) value (id
        , 10000, current_date, current_date);
    -- todo: implement
end$$

delimiter ;