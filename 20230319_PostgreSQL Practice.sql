+---------------+----------------------+------------+-------------+
| DEPARTMENT_ID | DEPARTMENT_NAME      | MANAGER_ID | LOCATION_ID |
+---------------+----------------------+------------+-------------+
|            10 | Administration       |        200 |        1700 |
|            20 | Marketing            |        201 |        1800 |
|            30 | Purchasing           |        114 |        1700 |
|            40 | Human Resources      |        203 |        2400 |
|            50 | Shipping             |        121 |        1500 |
|            60 | IT                   |        103 |        1400 |
|            70 | Public Relations     |        204 |        2700 |
|            80 | Sales                |        145 |        2500 |
|            90 | Executive            |        100 |        1700 |
|           100 | Finance              |        108 |        1700 |
|           110 | Accounting           |        205 |        1700 |
|           120 | Treasury             |          0 |        1700 |
|           130 | Corporate Tax        |          0 |        1700 |
|           140 | Control And Credit   |          0 |        1700 |
|           150 | Shareholder Services |          0 |        1700 |
|           160 | Benefits             |          0 |        1700 |
|           170 | Manufacturing        |          0 |        1700 |
|           180 | Construction         |          0 |        1700 |
|           190 | Contracting          |          0 |        1700 |
|           200 | Operations           |          0 |        1700 |
|           210 | IT Support           |          0 |        1700 |
|           220 | NOC                  |          0 |        1700 |
|           230 | IT Helpdesk          |          0 |        1700 |
|           240 | Government Sales     |          0 |        1700 |
|           250 | Retail Sales         |          0 |        1700 |
|           260 | Recruiting           |          0 |        1700 |
|           270 | Payroll              |          0 |        1700 |
+---------------+----------------------+------------+-------------+


-- Ben		: Yukarıdaki tabloyu postgresql de olusturacak ve verileri girecek kodları yazar mısın
-- ChatGBT	: Öncelikle, bu tabloyu oluşturmak için aşağıdaki SQL kodunu kullanabilirsiniz:

CREATE TABLE departments (
  department_id INTEGER PRIMARY KEY,
  department_name VARCHAR(50),
  manager_id INTEGER,
  location_id INTEGER
);
-- ChatGBT	: Sonrasında verileri eklemek için şu SQL kodunu kullanabilirsiniz:
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES 
  (10, 'Administration', 200, 1700),
  (20, 'Marketing', 201, 1800),
  (30, 'Purchasing', 114, 1700),
  (40, 'Human Resources', 203, 2400),
  (50, 'Shipping', 121, 1500),
  (60, 'IT', 103, 1400),
  (70, 'Public Relations', 204, 2700),
  (80, 'Sales', 145, 2500),
  (90, 'Executive', 100, 1700),
  (100, 'Finance', 108, 1700),
  (110, 'Accounting', 205, 1700),
  (120, 'Treasury', 0, 1700),
  (130, 'Corporate Tax', 0, 1700),
  (140, 'Control And Credit', 0, 1700),
  (150, 'Shareholder Services', 0, 1700),
  (160, 'Benefits', 0, 1700),
  (170, 'Manufacturing', 0, 1700),
  (180, 'Construction', 0, 1700),
  (190, 'Contracting', 0, 1700),
  (200, 'Operations', 0, 1700),
  (210, 'IT Support', 0, 1700),
  (220, 'NOC', 0, 1700),
  (230, 'IT Helpdesk', 0, 1700),
  (240, 'Government Sales', 0, 1700),
  (250, 'Retail Sales', 0, 1700),
  (260, 'Recruiting', 0, 1700),
  (270, 'Payroll', 0, 1700);
  
/*-- ChatGBT	: Bu kod, "departments" adlı bir tablo oluşturur ve ardından 
verileri ekler. Bu kodu çalıştırmadan önce, PostgreSQL veritabanınızda
bir veritabanı seçmeniz ve ardından bir sorgu aracı kullanmanız 
gerektiğini unutmayın. */

-- "employees" tablosunu oluştur
CREATE TABLE employees (
  employee_id     INT PRIMARY KEY,
  first_name      VARCHAR(50) NOT NULL,
  last_name       VARCHAR(50) NOT NULL,
  email           VARCHAR(100),
  phone_number    VARCHAR(20),
  hire_date       DATE,
  job_id          VARCHAR(10),
  salary          NUMERIC(8,2),
  commission_pct NUMERIC(2,2),
  manager_id      INT,
  department_id   INT
);

-- Verileri ekleyin
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) VALUES
(100, 'Steven', 'King', 'SKING', '515.123.4567', '1987-06-17', 'AD_PRES', 24000.00, 0.00, 0, 90),
(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1987-06-18', 'AD_VP', 17000.00, 0.00, 100, 90),
(102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '1987-06-19', 'AD_VP', 17000.00, 0.00, 100, 90),
(103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '1987-06-20', 'IT_PROG', 9000.00, 0.00, 102, 60),
(104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '1987-06-21', 'IT_PROG', 6000.00, 0.00, 103, 60),
(105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', '1987-06-22', 'IT_PROG', 4800.00, 0.00, 103, 60),
(106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '1987-06-23', 'IT_PROG', 4800.00, 0.00, 103, 60),
(107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '1987-06-24', 'IT_PROG', 4200.00, 0.00, 103, 60),
(108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '1987-06-25', 'FI_MGR', 12000.00, 0.00, 101,

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    street_address VARCHAR(50),
    postal_code VARCHAR(20),
    city VARCHAR(50),
    state_province VARCHAR(50),
    country_id CHAR(2)
);
 
 INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
VALUES 
    (1000, '1297 Via Cola di Rie', '989', 'Roma', NULL, 'IT'),
    (1100, '93091 Calle della Te', '10934', 'Venice', NULL, 'IT'),
    (1200, '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefectu', 'JP'),
    (1300, '9450 Kamiya-cho', '6823', 'Hiroshima', NULL, 'JP'),
    (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'),
    (1500, '2011 Interiors Blvd', '99236', 'South San', 'California', 'US'),
    (1600, '2007 Zagora St', '50090', 'South Brun', 'New Jersey', 'US'),
    (1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),
    (1800, '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'),
    (1900, '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'),
    (2000, '40-5-12 Laogianggen', '190518', 'Beijing', NULL, 'CN'),
    (2100, '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN'),
    (2200, '12-98 Victoria Stree', '2901', 'Sydney', 'New South Wale', 'AU'),
    (2300, '198 Clementi North', '540198', 'Singapore', NULL, 'SG'),
    (2400, '8204 Arthur St', NULL, 'London', NULL, 'UK'),
    (2500, 'Magdalen Centre, The', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK'),
    (2600, '9702 Chester Road', '9629850293', 'Stretford', 'Manchester', 'UK'),
    (2700, 'Schwanthalerstr. 703', '80925', 'Munich', 'Bavaria', 'DE'),
    (2800, 'Rua Frei Caneca 1360', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR'),
    (2900, '20 Rue des Corps-Sai', '1730', 'Geneva', 'Geneve', 'CH'),
    (3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH'),
    (3100, 'Pieter Breughelstraa', '3029SK', 'Utrecht', 'Utrecht', 'NL'),
    (3200, 'Mariano Escobedo 999', '11932', 'Mexico Cit',
	 
/*
3. Write a SQL subquery to find the first_name and last_name
	 of the employees under a manager who works for a department 
	 based in the United States. */

Hint : Write single-row and multiple-row subqueries



	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
-- SOLUTION ----	 
	 
SELECT first_name, last_name 
FROM employees 
WHERE manager_id in (select employee_id 
FROM employees WHERE department_id 
IN (SELECT department_id 
FROM departments 
WHERE location_id 
IN (select location_id 
FROM locations 
WHERE country_id='US')));
