create database studatt;
use studatt;

CREATE TABLE Student(
    s_id    INT           NOT NULL,
    s_name  VARCHAR(50) NOT NULL,
    s_phone int  NOT NULL,
    s_email VARCHAR(50) NOT NULL,
    s_class VARCHAR(50) NOT NULL,
    PRIMARY KEY (s_id)
);


alter table Student MODIFY s_phone varchar(20);



CREATE TABLE Professor (
    p_id    INT           NOT NULL,
    p_name  NVARCHAR (50) NOT NULL,
    p_phone NVARCHAR (50) NOT NULL,
    p_email NVARCHAR (50) NOT NULL,
    p_dept  NVARCHAR (50) NOT NULL,
    PRIMARY KEY (p_id)
);




CREATE TABLE Course(
	c_id   INT           NOT NULL,
    c_name VARCHAR (50) NOT NULL,
    p_id   INT           NOT NULL,
    PRIMARY KEY  (c_id ),
    CONSTRAINT FK_Course_ToTable_1 FOREIGN KEY (p_id) REFERENCES Professor (p_id)
);



CREATE TABLE attendance(
att_id INT NOT NULL,
s_id   INT NOT NULL,
c_id   INT NOT NULL,
semester INT NOT NULL,
report VARCHAR(50) NULL,
Week INT NOT NULL,
Day INT NULL,
attendance TINYINT NOT NULL,
CONSTRAINT PK_attendance PRIMARY KEY (att_id),
CONSTRAINT FK_attendance_ToTable FOREIGN KEY (s_id) REFERENCES Student (s_id),
CONSTRAINT FK_attendance_ToTable_1 FOREIGN KEY (c_id) REFERENCES Course (c_id)
);




CREATE TABLE selection (
    sel_id INT NOT NULL,
    c_id   INT NOT NULL,
    s_id   INT NOT NULL,
    PRIMARY KEY (sel_id ),
    CONSTRAINT FK_selection_ToTable FOREIGN KEY (s_id) REFERENCES Student (s_id),
    CONSTRAINT FK_selection_ToTable_1 FOREIGN KEY (c_id) REFERENCES Course (c_id)
);


use Studatt;

Create table Defaulter(
s_id int,
Semester int,
Def_flag1 TINYINT,
Def_flag2 TINYINT,
CONSTRAINT PK_Defaulter PRIMARY KEY (s_id));


select count(*) from defaulter;
select * from attendance ;
where report is not null;

DELIMITER //
Create procedure  sp_defaulterlist(totalDays int, p_semester int) 
Begin
cursor report is
Select s_id as sid,count(attendance) as StudentAttendance from attendance where attendance =1 and semester = p_semester group by s_id;

Open cursor report

If(100*(StudentAttendance/TotalDays) < 75)
  Update Defaulter set def_flag1 = true where studId = sid and semester = p_semester;
then End if ;

If(100*(StudentAttendance/TotalDays) < 50)
  Update Defaulter set def_flag2 = true where studId = sid and semester = p_semester;

then End if;
Close report;

End;




Report generating Query

-50% defaulter:
Select s_id, semester from Defaulter where def_flag2 = true;

--75% defaulter:
Select s_id, semester from Defaulter where def_flag1 = true;


The kind of reports that can be generated are:
• Semester wise attendance


• Daily attendance
select s.s_name Student_Name ,a.s_id Student_Number ,a.week Week,a.day Day from student s , attendance a where a.s_id=s.s_id;
#and s.s_name=&Student_Name;

• Attendance for extra class

• Subject wise attendance
 select s.s_name,c.c_name,a.week,a.day from attendance a,student s , course c where s.s_id=a.s_id and a.c_id=c.c_id group by c_name;
select s.s_name,c.c_name,a.week,a.day from attendance a,student s , course c where s.s_id=a.s_id and a.c_id=c.c_id and a.attendance=1 group by c_name,week order by week; 

• Leave reports (Approved/ Not approved /Medical leaves)

select s.s_name Student_Name ,a.s_id Student_Number, a.report Report ,a.week Week,a.day Day from student s , attendance a where a.s_id=s.s_id  and a.report is not null;

• Black listed below 50%
• Black listed below 75%



TEST DATA

INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (1, 'Hodor',9852364254,'hodor@a.com','IT')
INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (2, 'Bran',8521423654,'bran@a.com','IT')
INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (3, 'Robb', 4524123625,'robb@a.com','IT')
INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (4, 'Theon',7852123695,'theon@a.com','IT')
INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (6, 'Robert',7896325412,'robert@a.com','IT')
INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (7, 'Stanis',9685741232,'stanis@a.com','IT')
INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (8, 'Petyr',1234567890,'petyr@a.com','MECH');
INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (9, 'Daenerys',8521456328,'daeneris@a.com','MECH')
INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (10, 'Jon',1253698742,'jon@a.com','MECH')
INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (11, 'Cersei',8542136951,'cersei@a.com','MECH')
INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (12, 'Arya',1285964236,'arya@a.com','MECH')
INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (13, 'Tyrion',9999999990,'tyrion@a.com','MECH')
INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (14, 'Sansa',2225635841,'sansa@a.com','ELEC')
INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (15, 'Khal',8552174521,'khal@a.com', 'ELEC')
INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (16, 'Jaime',1112225635,'jaome@a.com', 'ELEC')
INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (17, 'Missandei',8569214551,'missandei@a.com','ELEC')
INSERT INTO Student (s_id, s_name, s_phone, s_email, s_class) VALUES (18, 'Jorah',8542169221,'jorah@a.com', 'ELEC')


INSERT INTO Professor (p_id,p_name,p_phone,p_email,p_dept) VALUES (1, N'Olenna', N'1258546325', N'olenna@a.com', N'ELEC')
INSERT INTO Professor (p_id,p_name,p_phone,p_email,p_dept) VALUES (2, N'Viserys', N'2352416235', N'viserys@a.com', N'ELEC')
INSERT INTO Professor (p_id,p_name,p_phone,p_email,p_dept) VALUES (3, N'Rickon', N'5552223365', N'rickon@a.com', N'ELEC')
INSERT INTO Professor (p_id,p_name,p_phone,p_email,p_dept) VALUES (4, N'Davos', N'8562142368', N'davos@a.com', N'IT')
INSERT INTO Professor (p_id,p_name,p_phone,p_email,p_dept) VALUES (5, N'Ellaria', N'1254862326', N'ellari@a.com', N'IT')
INSERT INTO Professor (p_id,p_name,p_phone,p_email,p_dept) VALUES (6, N'Catelyn', N'9856325412', N'catelyn@a.com', N'IT')
INSERT INTO Professor (p_id,p_name,p_phone,p_email,p_dept) VALUES (7, N'Grey', N'9988852153', N'grey@a.com', N'IT')
INSERT INTO Professor (p_id,p_name,p_phone,p_email,p_dept) VALUES (9, N'Obreyn', N'2222222222', N'obreyn@a.com', N'MECH')
INSERT INTO Professor (p_id,p_name,p_phone,p_email,p_dept) VALUES (10, N'Ramsay', N'3652652152', N'ramsay@a.coo', N'MECH')
INSERT INTO Professor (p_id,p_name,p_phone,p_email,p_dept) VALUES (11, N'Gregor', N'5555595423', N'gregor@a.com', N'MECH')

INSERT INTO Course (c_id, c_name,p_id) VALUES (1, N'C', 4)
INSERT INTO Course (c_id, c_name,p_id) VALUES (2, N'C++', 4)
INSERT INTO Course (c_id, c_name,p_id) VALUES (3, N'JAVA', 5)
INSERT INTO Course (c_id, c_name,p_id) VALUES (4, N'DBMS', 6)
INSERT INTO Course (c_id, c_name,p_id) VALUES (5, N'PYTHON', 7)
INSERT INTO Course (c_id, c_name,p_id) VALUES (6, N'EMBEDDED SYS', 1)
INSERT INTO Course (c_id, c_name,p_id) VALUES (7, N'DIGITAL CIRCUITS', 2)
INSERT INTO Course (c_id, c_name,p_id) VALUES (8, N'SATCOMM', 3)
INSERT INTO Course (c_id, c_name,p_id) VALUES (9, N'SIGNALS &  SYSTEMS', 1)
INSERT INTO Course (c_id, c_name,p_id) VALUES (10, N'DTSP', 2)
INSERT INTO Course (c_id, c_name,p_id) VALUES (11, N'SOM', 10)
INSERT INTO Course (c_id, c_name,p_id) VALUES (12, N'ED', 10)
INSERT INTO Course (c_id, c_name,p_id) VALUES (13, N'THERMO', 9)
INSERT INTO Course (c_id, c_name,p_id) VALUES (14, N'MACHINERY', 11)
INSERT INTO Course (c_id, c_name,p_id) VALUES (15, N'TOM', 9)


INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (1, 1, 1, 1, NULL, 1, 1, 1)   ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (2, 1, 1, 1, NULL, 1, 3, 1)   ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (3, 1, 1, 1, NULL, 2, 1, 0)   ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (4, 1, 1, 1, NULL, 2, 3, 1)   ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (5, 1, 1, 1, NULL, 3, 1, 1)   ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (6, 1, 1, 1, NULL, 3, 3, 1)   ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (7, 1, 4, 1, NULL, 1, 2, 1)   ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (8, 1, 4, 1, NULL, 1, 4, 1)   ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (9, 1, 4, 1, NULL, 2, 2, 1)   ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (10, 1, 4, 1, NULL, 2, 4, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (11, 1, 4, 1, NULL, 3, 2, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (12, 1, 4, 1, NULL, 3, 4, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (13, 1, 3, 1, NULL, 1, 5, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (14, 1, 3, 1, NULL, 2, 5, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (16, 1, 3, 1, NULL, 3, 5, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (17, 2, 5, 2, NULL, 1, 2, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (18, 2, 5, 2, NULL, 1, 3, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (19, 2, 5, 2, NULL, 2, 2, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (21, 2, 5, 2, NULL, 2, 3, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (23, 2, 5, 2, NULL, 3, 2, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (25, 2, 5, 2, NULL, 3, 3, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (27, 2, 4, 2, NULL, 1, 2, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (29, 2, 4, 2, NULL, 1, 4, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (30, 2, 4, 2, NULL, 2, 2, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (33, 2, 4, 2, NULL, 2, 4, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (34, 2, 4, 2, NULL, 3, 2, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (35, 2, 4, 2, NULL, 3, 4, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (36, 3, 5, 2, NULL, 1, 2, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (38, 3, 5, 2, NULL, 1, 3, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (39, 3, 5, 2, NULL, 2, 2, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (40, 3, 5, 2, NULL, 2, 3, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (41, 3, 5, 2, NULL, 3, 2, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (43, 3, 5, 2, NULL, 3, 3, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (44, 3, 4, 2, NULL, 1, 2, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (45, 3, 4, 2, NULL, 1, 4, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (46, 3, 4, 2, NULL, 2, 2, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (47, 3, 4, 2, NULL, 2, 4, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (48, 3, 4, 2, NULL, 3, 2, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (49, 3, 4, 2, NULL, 3, 4, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (50, 3, 2, 2, NULL, 1, 4, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (53, 3, 2, 2, NULL, 2, 4, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (54, 3, 2, 2, NULL, 3, 4, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (55, 3, 3, 2, NULL, 1, 3, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (57, 3, 3, 2, NULL, 2, 3, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (58, 3, 3, 2, NULL, 3, 3, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (59, 4, 1, 1, NULL, 1, 1, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (61, 4, 1, 1, NULL, 1, 3, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (62, 4, 1, 1, NULL, 2, 1, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (64, 4, 1, 1, NULL, 2, 3, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (65, 4, 1, 1, NULL, 3, 1, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (67, 4, 1, 1, NULL, 3, 3, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (68, 4, 3, 1, NULL, 1, 5, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (70, 4, 3, 1, NULL, 2, 5, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (71, 4, 3, 1, NULL, 3, 5, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (72, 4, 4, 1, NULL, 1, 2, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (78, 4, 4, 1, NULL, 1, 4, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (79, 4, 4, 1, NULL, 2, 2, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (80, 4, 4, 1, NULL, 2, 4, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (81, 4, 4, 1, NULL, 3, 2, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (82, 4, 4, 1, NULL, 3, 4, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (83, 6, 3, 2, NULL, 1, 5, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (84, 6, 3, 2, NULL, 2, 5, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (85, 6, 3, 2, NULL, 3, 5, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (86, 6, 5, 2, NULL, 1, 2, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (87, 6, 5, 2, NULL, 1, 3, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (88, 6, 5, 2, NULL, 2, 2, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (89, 6, 5, 2, NULL, 2, 3, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (90, 6, 5, 2, NULL, 3, 2, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (91, 6, 5, 2, NULL, 3, 3, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (93, 6, 2, 2, NULL, 1, 4, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (94, 6, 2, 2, NULL, 2, 4, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (95, 6, 2, 2, NULL, 3, 4, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (96, 7, 1, 1, NULL, 1, 1, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (97, 7, 1, 1, NULL, 1, 3, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (98, 7, 1, 1, NULL, 2, 1, 0)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (99, 7, 1, 1, NULL, 2, 3, 1)  ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (100, 7, 1, 1, NULL, 3, 1, 1) ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (101, 7, 1, 1, NULL, 3, 3, 0) ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (102, 7, 2, 1, NULL, 1, 4, 1) ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (103, 7, 2, 1, NULL, 2, 4, 1) ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (104, 7, 2, 1, NULL, 3, 4, 1) ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (105, 7, 3, 1, NULL, 1, 5, 1) ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (106, 7, 3, 1, NULL, 2, 5, 1) ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (107, 7, 3, 1, NULL, 3, 5, 1) ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (108, 7, 4, 1, NULL, 1, 2, 1) ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (109, 7, 4, 1, NULL, 1, 4, 1) ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (110, 7, 4, 1, NULL, 2, 2, 0) ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (111, 7, 4, 1, NULL, 2, 4, 1) ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (112, 7, 4, 1, NULL, 3, 2, 1) ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (113, 7, 4, 1, NULL, 3, 4, 0) ;
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (114, 8, 11, 1, NULL, 1, 1, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (115, 8, 11, 1, NULL, 1, 3, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (116, 8, 11, 1, NULL, 2, 1, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (117, 8, 11, 1, NULL, 2, 3, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (118, 8, 11, 1, NULL, 3, 1, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (119, 8, 11, 1, NULL, 3, 3, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (120, 8, 12, 1, NULL, 1, 4, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (121, 8, 12, 1, NULL, 2, 4, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (122, 8, 12, 1, NULL, 3, 4, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (123, 8, 13, 1, NULL, 1, 5, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (124, 8, 13, 1, NULL, 2, 5, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (125, 8, 13, 1, NULL, 3, 5, 0);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (126, 8, 15, 1, NULL, 1, 2, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (127, 8, 15, 1, NULL, 1, 3, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (128, 8, 15, 1, NULL, 2, 2, 0);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (129, 8, 15, 1, NULL, 2, 3, 0);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (130, 8, 15, 1, NULL, 3, 2, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (131, 8, 15, 1, NULL, 3, 3, 0);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (133, 9, 11, 2, NULL, 1, 1, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (134, 9, 11, 2, NULL, 1, 3, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (135, 9, 11, 2, NULL, 2, 1, 0);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (137, 9, 11, 2, NULL, 2, 3, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (138, 9, 11, 2, NULL, 3, 1, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (139, 9, 11, 2, NULL, 3, 3, 0);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (140, 9, 15, 2, NULL, 1, 2, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (142, 9, 15, 2, NULL, 1, 3, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (143, 9, 15, 2, NULL, 2, 2, 0);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (144, 9, 15, 2, NULL, 2, 3, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (145, 9, 15, 2, NULL, 3, 2, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (146, 9, 15, 2, NULL, 3, 3, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (147, 9, 13, 2, NULL, 1, 5, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (148, 9, 13, 2, NULL, 2, 5, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (150, 9, 13, 2, NULL, 3, 5, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (151, 9, 12, 2, NULL, 1, 4, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (152, 9, 12, 2, NULL, 2, 4, 1);
INSERT INTO attendance (att_id, s_id, c_id, semester, report, Week, Day, attendance) VALUES (153, 9, 12, 2, NULL, 3, 4, 0);


INSERT INTO selection (sel_id, c_id,s_id) VALUES (3, 1, 1)    ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (4, 4, 1)    ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (5, 3, 1)    ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (6, 5, 2)    ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (7, 4, 2)    ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (8, 5, 3)    ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (9, 4, 3)    ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (10, 2, 3)   ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (11, 3, 3)   ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (12, 1, 4)   ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (13, 3, 4)   ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (14, 4, 4)   ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (16, 3, 6)   ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (17, 5, 6)   ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (18, 2, 6)   ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (19, 1, 7)   ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (20, 2, 7)   ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (21, 3, 7)   ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (22, 4, 7)   ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (23, 11, 8)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (25, 12, 8)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (26, 13, 8)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (27, 15, 8)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (29, 11, 9)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (30, 15, 9)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (31, 13, 9)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (32, 12, 9)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (33, 11, 10) ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (34, 12, 10) ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (35, 14, 10) ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (36, 11, 11) ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (37, 12, 11) ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (38, 13, 11) ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (39, 15, 12) ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (40, 12, 12) ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (42, 15, 13) ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (43, 13, 13) ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (45, 11, 13) ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (46, 10, 14) ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (47, 9, 14)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (48, 7, 14)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (49, 9, 15)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (50, 6, 15)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (51, 8, 15)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (52, 7, 16)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (54, 6, 16)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (55, 9, 16)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (56, 10, 16) ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (57, 6, 17)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (58, 7, 17)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (59, 6, 18)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (60, 8, 18)  ;
INSERT INTO selection (sel_id, c_id,s_id) VALUES (61, 10, 18) ;
