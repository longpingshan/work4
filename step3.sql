3-1.把peoples表中school不是GDUFS的人全部找出来？（包括school为NULL的人）写出MySQL语句。
(1) 建表
CREATE TABLE `test`.`people` (
  `id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NULL,
  `school` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
(2)插入数据
insert into people values (1,'a','huagong');
insert into people values (2,'b','GDUFS');
insert into people values (3,'c','GDUFS');
insert into people values (4,'d','null');
insert into people values (5,'e','huanong');
insert into people values (6,'f','');
(3)执行命令
select id,name,school
from people 
where school not in('GDUFS');
(4)输出结果
'1', 'a', 'huagong'
'4', 'd', 'null'
'5', 'e', 'huanong'
'6', 'f', ''

3-2.查找计算机系每次考试学生的平均成绩(最终显示考试名称, 平均分)。
(1) 执行命令
select dept_name,avg(grade)
from exam,student
where exam.student_ID=student.ID and dept_name='computer'
group by dept_name;
(2)输出结果
'Computer','78.2500'

3-3.查找女学霸（考试平均分达到80分或80分以上的女生的姓名, 分数）。
(1) 执行命令
select student_ID,avg(grade),name
from exam,student
where sex='f' 
group by student_ID
having avg(grade)>=80
(2)输出结果
'1', '80.7500'
'4', '80.5000'
'8', '84.2500'
'14', '81.0000'
'17', '83.5000'
'19', '81.5000'
'20', '90.0000'

3-4.找出人数最少的院系以及其年度预算。
执行命令
with min_count(value,dept_name) as
    (select count(ID),dept_name
     from student
     group by dept_name)
select budget,min(value)
from min_count,department
where department.dept_name=min_count.dept_name

3-5.计算机系改名了，改成计算机科学系（comp. sci.），写出mysql语句。
(1) 执行命令
update department
set dept_name='comp. sci.'
where dept_name='computer'
select * from department
select * from student
(2)输出结果
department:
'biology', 'Building_B', '24000'
'comp. sci.', 'Building_A', '12000'
'math', 'Buding_E', '35000'
'new', 'Building_D', '8000'
'physics', 'Building_C', '28000'
student:(因为设置了ca)
'1', '廉萱妍', 'f', '19', 'loving', 'comp. sci.'
'2', '荀良运', 'm', '17', 'single', 'comp. sci.'
'3', '尹枫起', 'm', '14', 'loving', 'comp. sci.'
'4', '皇甫梦心', 'f', '13', 'loving', 'comp. sci.'


3-6.修改每个系的年度预算，给该系的每个学生发2000元奖金。（修改每个系的年度预算为 原预算+该系人数*2000）。
执行命令
with countid(value,dept_name) as
    (select count(ID),dept_name
    from student
    group by dept_name)
update department
set budget=budget+countid.value*2000
where countid.dept_name=department.dept_name

3-7.向department表中插入一条数据, dept_name属性的值为avg_budget, building为空, 年度预算为所有院系的年度预算平均值.
(1) 执行命令
select avg(budget)
from department
insert into department values('avg_budget',null,null)
update department
set budget=21400
where dept_name='avg_budget'

select * from department

(2)输出结果
'avg_budget', NULL, '21400'

3-8. 删除计算机系中考试成绩平均分低于70的学生.
(1) 执行命令
delete from student
where dept_name='comp. sci.' and ID in(
select student_ID
from exam
group by student_ID
having avg(grade)<70
)

3-9.找出所有正在谈恋爱,但是学习成绩不佳(考试平均分低于75)的学生,强制将其情感状态改为单身.
(1) 执行命令
update student
set emotion_state='single'
where emotion_state='loving' and ID in(
select student_ID
from exam
group by student_ID
having avg(grade)<75
)

3-10(选做). 对每个学生, 往exam表格中插入名为Avg_Exam的考试, 考试分数为之前学生参加过考试的平均分.
3-10answer:
insert into exam (select student_ID,'avg_exam',avg(grade) from exam group by student_ID);
将主键设置为自增
