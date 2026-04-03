create database student_db;
use student_db;
create table students(
  student_id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  department VARCHAR(50)
);
create table courses(
  course_id INT PRIMARY KEY,
  course_name VARCHAR(50)
  );
  create table marks(
   mark_id INT PRIMARY KEY,
   student_id INT,
   course_id INT,
   marks INT,
   FOREIGN KEY(student_id)REFERENCES students(student_id),
   FOREIGN KEY(course_id)REFERENCES courses(course_id)
   );
   insert into students values
   (1,"Shabrin",19,"CSE"),
   (2,"Anu",20,"IT"),
   (3,"Harini",18,"ECE"),
   (4,"Kusuma",19,"CSE"),
   (5,"Sam",20,"IT"),
   (6,"Ram",19,"IT"),
   (7,"Sita",20,"IT"),
   (8,"Pavan",18,"ECE"),
   (9,"Archana",19,"CSE"),
   (10,"Kavya",20,"CSE");
   insert into courses values
   (101,"DBMS"),
	(102,"Java"),
	(103,"OS"),
	(104,"Maths");
    insert into marks values
    (1,1,101,85),
   (2,1,102,90),
   (3,2,103,79),
   (4,2,101,90),
   (5,3,102,88),
   (6,3,104,85),
   (7,4,103,82),
   (8,5,102,90),
   (9,6,103,91),
   (10,7,102,75),
   (11,10,103,71),
   (12,10,101,88),
   (13,8,104,72),
   (14,9,104,80),
   (15,7,103,73);
   select * from students;
   select students.name,courses.course_name,marks.marks
   from marks
   join students on students.student_id = marks.student_id
   join courses on courses.course_id = marks.course_id;
  select s.name,c.course_name,m.marks,
  case
  WHEN m.marks >=90 THEN "A"
    WHEN m.marks >=75 THEN "B"
    ELSE "C"
    END AS grade
  from marks m
  join students s on s.student_id = m.student_id
  join courses c on c.course_id = m.course_id;
  select s.name,sum(m.marks) as total
  from students s
  join marks m on s.student_id = m.student_id
  group by s.name
  order by total desc;
  select*from marks
  where marks >85;
  select course_id,MAX(marks) as highest
  from marks
  group by course_id;
  select student_id,AVG(marks) as avg_marks
  from marks
  group by student_id
  having avg_marks > 80;