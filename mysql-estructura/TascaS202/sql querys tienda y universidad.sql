USE tienda;

SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, ROUND(precio / 0.83, 2) FROM producto;
SELECT nombre AS 'nom de producto', precio AS euros, ROUND(precio / 0.83, 2) AS dolars FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(LEFT(nombre, 2)) FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, TRUNCATE(precio,0) FROM producto;
SELECT f.codigo FROM fabricante f LEFT JOIN producto p ON f.codigo=p.codigo_fabricante;
SELECT DISTINCT f.codigo FROM fabricante f LEFT JOIN producto p ON f.codigo=p.codigo_fabricante;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3, 2;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;
SELECT p.codigo, p.nombre, f.codigo, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;
SELECT p.* FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';
SELECT p.* FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND precio > 200;
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre="Hewlett-Packard" OR f.nombre= "Seagate";
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus' ,"Hewlett-Packard", "Seagate");
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE LOWER(f.nombre) LIKE '%w%';
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
SELECT DISTINCT f.nombre, f.codigo FROM fabricante f RIGHT JOIN producto p ON p.codigo_fabricante = f.codigo;
SELECT f.nombre, f.codigo, p.* FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo;
SELECT f.nombre, f.codigo, p.* FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo WHERE p.codigo IS NULL;
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
SELECT * FROM producto WHERE precio = ( SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT nombre, precio FROM producto WHERE codigo_fabricante = 2 ORDER BY precio DESC LIMIT 1;
SELECT nombre, precio FROM producto WHERE codigo_fabricante = 3 ORDER BY precio ASC LIMIT 1;
SELECT p.* FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2);
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' AND p.precio > (SELECT AVG(p2.precio) FROM producto p2 JOIN fabricante f2 ON p2.codigo_fabricante = f2.codigo WHERE f2.nombre = 'Asus');

USE universidad;

SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 2 ORDER BY apellido1, apellido2, nombre;
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 2 AND telefono IS NULL;
SELECT * FROM persona WHERE tipo = 2 AND YEAR(fecha_nacimiento) = 1999;
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 1 AND telefono IS NULL AND RIGHT(nif, 1) = 'K';
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM persona p JOIN departamento d JOIN profesor pr ON p.id = pr.id_profesor AND d.id = pr.id_departamento ORDER BY p.apellido1, p.apellido2, p.nombre;
SELECT a.nombre, c.anyo_inicio, c.anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura aa JOIN asignatura a JOIN curso_escolar c ON aa.id_alumno=p.id AND aa.id_asignatura=a.id AND aa.id_curso_escolar = c.id WHERE p.tipo = 2 AND p.nif='26902806M';
SELECT DISTINCT d.nombre FROM departamento d Join asignatura a JOIN grado g JOIN profesor p ON g.id = a.id_grado AND a.id_profesor = p.id_profesor AND p.id_departamento = d.id WHERE g.id=4;
SELECT DISTINCT p.* FROM persona p JOIN alumno_se_matricula_asignatura aa JOIN asignatura a JOIN curso_escolar c ON aa.id_alumno=p.id AND aa.id_asignatura=a.id AND aa.id_curso_escolar = c.id WHERE c.anyo_inicio=2018;

SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM persona p RIGHT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON d.id = pr.id_departamento ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
SELECT p.* FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor WHERE pr.id_profesor IS NULL;
SELECT d.* FROM profesor p RIGHT JOIN departamento d ON p.id_departamento = d.id WHERE p.id_profesor IS NULL;
SELECT p.* FROM persona p RIGHT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE a.id_profesor IS NULL;
SELECT a.* FROM profesor pr RIGHT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE a.id_profesor IS NULL;
SELECT d.* From curso_escolar c RIGHT JOIN alumno_se_matricula_asignatura aa on c.id=aa.id_curso_escolar RIGHT JOIN asignatura a ON aa.id_asignatura=a.id RIGHT JOIN profesor p ON a.id_profesor= p.id_profesor LEFT JOIN departamento d ON p.id_departamento=d.id;

SELECT COUNT(*) FROM persona p WHERE p.tipo=2;
SELECT COUNT(*) FROM persona WHERE tipo = 2 AND YEAR(fecha_nacimiento) = 1999;
SELECT d.nombre, COUNT(p.id_profesor) AS numero_profesores FROM departamento d JOIN profesor p ON d.id=p.id_departamento GROUP BY d.id;
SELECT d.nombre, COUNT(p.id_profesor) AS numero_profesores FROM departamento d LEFT JOIN profesor p ON d.id=p.id_departamento GROUP BY d.id;
SELECT g.nombre, COUNT(a.id) AS numero_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id=a.id_grado GROUP BY g.id ORDER BY COUNT(a.id) DESC;
SELECT g.nombre, COUNT(a.id) AS numero_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id=a.id_grado GROUP BY g.id HAVING COUNT(a.id) > 40 ORDER BY COUNT(a.id) DESC;
SELECT g.nombre,SUM(a.creditos), a.tipo FROM asignatura a JOIN grado g ON a.id_grado=g.id GROUP BY a.tipo, g.id;
SELECT c.anyo_inicio, COUNT(a.id_alumno) FROM curso_escolar c JOIN alumno_se_matricula_asignatura a ON c.id=a.id_curso_escolar GROUP BY c.id;
SELECT DISTINCT p.id,p.nombre,p.apellido1,p.apellido2,COUNT(a.id) FROM persona p RIGHT JOIN profesor pr ON p.id=pr.id_profesor LEFT JOIN asignatura a ON a.id_profesor=pr.id_profesor GROUP BY p.id, a.id ORDER BY COUNT(a.id) DESC;
SELECT * FROM persona WHERE tipo=2 AND fecha_nacimiento = (SELECT MIN(fecha_nacimiento) FROM persona WHERE tipo = 2);
SELECT p.* FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE p.tipo = 1 AND pr.id_departamento IS NOT NULL AND a.id IS NULL;