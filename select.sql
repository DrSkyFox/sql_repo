# Сделать запрос, в котором мы выберем все данные о городе – регион, страна.
select c.id, c.title, r.title, ct.title
from _cities as c
         left join _regions as r on c.region_id = r.id
         left join _countries as ct on r.country_id = ct.id
order by c.id

# Выбрать все города из Московской области.
select c.title
from _cities as c
         left join _regions as r on c.region_id = r.id
where r.title like 'Московская область'


# Выбрать среднюю зарплату по отделам.
select d.dept_name, avg(s.salary) as average_salary
from salaries as s
         inner join employees e on s.emp_no = e.emp_no
         inner join dept_emp de on e.emp_no = de.emp_no
         inner join departments d on d.dept_no = de.dept_no
group by d.dept_no, d.dept_name

# Выбрать максимальную зарплату у сотрудника.
select e.emp_no, e.first_name, e.last_name, max(s.salary) as max_salary
from salaries as s
         join employees e on e.emp_no = s.emp_no
group by e.emp_no
order by max_salary desc

# Удалить одного сотрудника, у которого максимальная зарплата.
delete
from employees e
where e.emp_no = (select x.emp_no
                  from (
                           select e.emp_no, max(s.salary) as max_salary
                           from salaries as s
                                    join employees e on e.emp_no = s.emp_no
                           group by e.emp_no
                           order by max_salary desc
                           limit 1) as x)

# Посчитать количество сотрудников во всех отделах
select de.dept_no, dept_name, count(de.emp_no) from dept_emp de
left join departments d on d.dept_no = de.dept_no
group by de.dept_no


# найти количество сотрудников в отделах и посмотреть, сколько всего денег получает отдел
select de.dept_no, dept_name, count(distinct de.emp_no), sum(salary) from dept_emp de
left join departments d on d.dept_no = de.dept_no
left join salaries s on de.emp_no = s.emp_no
group by de.dept_no