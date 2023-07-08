-- 1. Afisati numele si salariile angajatilor.

SELECT last_name, salary
FROM employees;

-- 2. Afisati numele de familie si salariul angajatilor care castiga mai mult de $12,000.

SELECT last_name, salary
FROM employees
WHERE salary > 12000;

-- 3. Afisati numele de familie si salariul pentru toti angajatii al caror salariu nu se afla
-- in intervalul $5,000 - $12,000.

SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

-- 4. Afisati numele de familie, loc de munca (job ID) si data de inceput (data angajarii)
-- pentru angajatii cu numele de familie Smith si Taylor. Ordonați rezultatele în ordine
-- crescătoare după data angajarii.

SELECT last_name, job_id, hire_date
FROM employees
WHERE last_name IN ('Smith', 'Taylor')
ORDER BY hire_date ASC;

-- 5. Afisati numele de familie si numele departamentului pentru angajatii din
-- departamentele 20 sau 50 in ordine alfabetica crescatoare dupa nume.

SELECT e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id IN (20, 50)
ORDER BY e.last_name ASC;

-- 6. Afisati numele de familie si denumirea functiei pentru toti angajatii care nu au un
-- manager.

SELECT e.last_name, j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.manager_id IS NULL;

-- 7. Afisati numele de familie, salariul si comisionul pentru toti angajatii care castiga
-- comisioane. Sortați datele în ordine descrescătoare a salariilor și comisioanelor.

SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;

-- 8. Găsiți cel mai mare, cel mai mic salariu și salariul mediu al tuturor angajaților.
-- Etichetați coloanele Maxim, Minim, Suma și respectiv, Medie.

SELECT
  MAX(salary) AS Maxim,
  MIN(salary) AS Minim,
  SUM(salary) AS Suma,
  AVG(salary) AS Medie
FROM employees;

-- 9. Modificati interogarea anterioara pentru a afisa Minim, Maxim, Suma si salariul
-- mediu pentru fiecare loc de munca (job_ID).

SELECT job_id,
       MIN(salary) AS Minim,
       MAX(salary) AS Maxim,
       SUM(salary) AS Suma,
       AVG(salary) AS Medie
FROM employees
GROUP BY job_id;

-- 10. Afisati numarul persoanelor cu acelasi loc de munca.

SELECT job_id, COUNT(*) AS Numar_de_persoane
FROM employees
GROUP BY job_id;

-- 11. Determinati numarul managerilor fara a lista angajatii. Etichetati coloana
-- Numarul Managerilor. Sugestie: Folositi coloana Manager_ID din tabela cu angajati
-- pentru a determina numarul managerilor.

SELECT COUNT(DISTINCT manager_id) AS "Numarul Managerilor"
FROM employees;

-- 12. Gasiti diferenta dintre cel mai mare și cel mai mic salariu. Etichetati coloana
-- Diferenta.

SELECT MAX(salary) - MIN(salary) AS "Diferenta"
FROM employees;

-- 13. Gasiti adresele tuturor departamentelor. Utilizati tabelele LOCATIONS si
-- COUNTRIES.

SELECT d.department_id, d.department_name, l.street_address, l.postal_code, l.city, c.country_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id;

-- 14. Afisati la iesire, ID_Locatie, adresa strazii, orasul, statul sau provincia si tara.

SELECT l.location_id AS ID_Locatie, l.street_address AS Adresa, l.city AS Oras, l.state_province AS Stat_Prov, c.country_name AS Tara
FROM locations l
JOIN countries c ON l.country_id = c.country_id;

-- 15. Afisati numele de familie, locul de munca, numarul departamentului si numele
-- departamentului pentru toti angajatii care lucreaza in Toronto.

SELECT e.last_name AS Nume_Familie, e.job_id AS Loc_Munca, e.department_id AS Numar_Departament, d.department_name AS Nume_Departament
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'Toronto';

-- 16. Arătați numele și numerele tuturor managerilor împreună cu numărul de
-- angajați care sunt subordonații fiecaruia.

SELECT m.last_name AS Nume_Manager, COUNT(e.employee_id) AS Numar_Angajati
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
GROUP BY  m.last_name;

-- 17. Creati o interogare care sa afiseze numele departamentului, numele locatiei,
-- denumirea functiei si salariul al acelor angajati care lucreaza intr-o locatie specifica
-- (data).



-- 18. Gasiti numarul angajatilor al caror nume de familie se termina in litera “n”.

SELECT COUNT(*) AS Numar_Angajati
FROM employees
WHERE last_name LIKE '%n';

-- 19. Creati o interogare care afiseaza numele, locatia si numarul de angajati pentru
-- fiecare departament. Asigurati-va ca rezultatul include, de asemenea, si
-- departamentele fara angajati.



-- 20. Afisati toti angajatii care au fost angajati in prima jumatate a lunii (inainte de ziua
-- de 16 a lunii).

SELECT *
FROM employees
WHERE EXTRACT(DAY FROM hire_date) < 16;

-- 21. Creati o interogare pentru a afisa numarul departamentelor cu salariul mediu cel
-- mai mare.



-- 22. Creați o interogare care afișează un departament în care nu lucrează
-- reprezentanți de vânzări. Includeti la iesire, numarul departamentului, numele
-- departamentului si locatia.



-- 23. Afisati numarul departamentului, numele departamentului, si numarul
-- angajatilor pentru departamentul cu:
-- a) cel mai mare numar de angajati

SELECT d.department_id, d.department_name, COUNT(*) AS numar_angajati
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) = (
    SELECT MAX(numara_angajati)
    FROM (
        SELECT department_id, COUNT(*) AS numara_angajati
        FROM employees
        GROUP BY department_id
    ) 
);

-- b) cel mai mic numar de angajati

SELECT d.department_id, d.department_name, COUNT(*) AS numar_angajati
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) = (
    SELECT MIN(numara_angajati)
    FROM (
        SELECT department_id, COUNT(*) AS numara_angajati
        FROM employees
        GROUP BY department_id
    ) 
);

-- c) departamentele cu mai putin de trei angajati

SELECT d.department_id, d.department_name, COUNT(*) AS numar_angajati
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) < 3;

-- 24. Afisati anii si numarul total de angajati care au fost angajati in acel an.

SELECT EXTRACT(YEAR FROM hire_date) AS AN, COUNT(*) AS numar_angajati
FROM employees
GROUP BY EXTRACT(YEAR FROM hire_date)
ORDER BY EXTRACT(YEAR FROM hire_date);

-- 25. Afisati tarile si numarul locatiilor in acea tara.

SELECT country_name AS Tara, COUNT(*) AS "Numarul de Locatii"
FROM locations
JOIN countries ON locations.country_id = countries.country_id
GROUP BY country_name;

-- 26. Scrieti o interogare in SQL pentru a afisa intreg numele (numele si prenumele) si
-- salariul pentru acei angajti care castiga sub 6000.

SELECT CONCAT(first_name, CONCAT(' ', last_name)) AS Nume_Complet, salary AS Salariu
FROM employees
WHERE salary < 6000;

-- 27. Scrieți o interogare în SQL pentru a afișa numele complet (numele și prenumele),
-- data angajarii, procentul comisionului, e-mailul și telefonul, separate de '-' și salariul
-- pentru acei angajați care câștigă salariul de peste 11000 sau a șaptea cifră în numărul
-- de telefon este egal cu 3 și sortați rezultatul într-o ordine descrescătoare după nume.

SELECT CONCAT(first_name, CONCAT(' ', last_name)) AS Nume_Complet, hire_date AS Data_Angajarii,
       commission_pct AS Procent_Comision, CONCAT(email, CONCAT(' - ', phone_number)) AS Detalii_Contact,
       salary AS Salariu
FROM employees
WHERE salary > 11000 OR SUBSTR(phone_number, 7, 1) = '3'
ORDER BY Nume_Complet DESC;

-- 28. Scrieți o interogare în SQL pentru a afișa ID-ul pentru acei angajați care au avut
-- două sau mai multe locuri de muncă în trecut.

SELECT employee_id AS ID_angajat
FROM job_history
GROUP BY employee_id
HAVING COUNT(*) >= 2;

-- 29. Scrieți o interogare pentru a afișa toate informațiile angajaților ale căror salarii
-- sunt în intervalul cel mai mic salariu și 2500.

SELECT *
FROM employees
WHERE salary BETWEEN (SELECT MIN(salary) FROM employees) AND 2500;

-- 30. Scrieți o interogare pentru a afișa numele angajatului (numele și prenumele) și
-- data de angajare pentru toți angajații din același departament ca si Clara (prenume).
-- Excludeti-o pe Clara.

SELECT CONCAT(last_name, CONCAT(' ', first_name)) AS Nume_angajat, hire_date
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM employees
    WHERE first_name = 'Clara'
) AND first_name != 'Clara';

-- 31. Scrieți o interogare pentru a afișa numărul angajatului, numele (numele și
-- prenumele) și titlul postului pentru toți angajații al căror salariu este mai mic decât
-- orice salariu al acelor angajați al căror titlu de post este MK_MAN.

SELECT e.employee_id, CONCAT(e.last_name, CONCAT(' ', e.first_name)) AS nume, j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary < (
    SELECT MAX(salary)
    FROM employees
    WHERE job_id = 'MK_MAN'
);

-- 32. Scrieți o interogare pentru a identifica toți angajații care câștigă mai mult decât
-- media și care lucrează în oricare dintre departamentele IT.

SELECT employee_id, CONCAT(last_name, CONCAT(', ', first_name)) AS Nume, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id IN (
        SELECT department_id
        FROM departments
        WHERE department_name LIKE '%IT%'
    )
);