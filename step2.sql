#coding:utf-8
# -*-coding:utf-8 -*-
import MySQLdb
import os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
if __name__ == '__main__':
    # 连接数据库
    conn = MySQLdb.connect(
        host='localhost',
        port=3306,
        user='root',
        passwd='123',
        charset="utf8",
        db='university',
    )

    # 获取数据库执行游标
    cur = conn.cursor()
    # # 测试：
    # cur.execute("insert into department values ('computer','Building_A',12000)")
    # cur.execute("select * from department")
    # data = cur.fetchone()
    # print "Database version : %s, %s,%d" % data
    # conn.commit()

    # 向department插入数据
    # 测试
    # character="insert into department(dept_name,building,budget) values (%s,%s,%s)"
    # data=[('biology','Building_B','24000'),('physics','Building_C','28000'),('new','Building_D','8000'),('math','Buding_E','35000')]
    # cur.executemany(character,data)
    # cur.execute("select * from department")
    # rows=cur.fetchall(), ！！！！插入必须为字符串类型，但不会影响数据库
    # for row in rows:
    #    print row
    # conn.commit()
    # cur.execute("insert into department values ('computer','Building_A',12000)")
    # cur.execute("insert into department values ('biology','Building_B',24000)")
    # cur.execute("insert into department values ('physics','Building_C',28000)")
    # cur.execute("insert into department values ('new','Building_D',8000)")
    # cur.execute("insert into department values ('math','Buding_E',35000)")
    # conn.commit()

    # 多条数据插入
    # character = "insert into student(ID,name,sex,age,emotion_state,dept_name) values (%s,%s,%s,%s,%s,%s)"
    # data=[('1', '廉萱妍', 'f', '19', 'loving', 'computer'),('2' ,'荀良运', 'm', '17', 'single' ,'computer'),('3','尹枫起' ,'m', '14', 'loving', 'computer'),('4', '皇甫梦心', 'f', '13', 'loving', 'computer'),
    #       ('5', '司马海禧', 'm', '24', 'loving', 'computer'),('6', '薛珊柏', 'f', '21', 'single', 'biology'), ('7', '皇甫驰钊', 'm', '21', 'single', 'physics'),('8', '骆谷震', 'm', '23', 'single', 'computer'),
    #       ('9', '吕禧逸', 'm', '18', 'single', 'biology'),('10', '公孙子晨', 'm', '20', 'loving', 'physics'), ('11', '王凡康', 'm', '21', 'loving', 'physics'),('12', '谢婷桃', 'f','21', 'single', 'computer'),('13', '寿雨华', 'f' ,'20', 'single', 'physics'),
    #       ('14', '昌菲婧', 'f', '19', 'loving', 'new'), ('15', '赵梓梓', 'm', '22', 'loving', 'biology'),('16', '尉迟彩鑫', 'f', '22', 'single' ,'new'),('17', '毛骏钊', 'm', '23', 'single', 'new'),('18', '吴腾梁', 'm', '17', 'loving', 'math'),('19', '庞德骏', 'm', '23','loving', 'math'),('20', '梅昭凡', 'f' ,'18', 'single', 'computer')]
    # cur.executemany(character,data)
    # cur.execute("select * from student")
    # # rows=cur.fetchall()
    # # for row in rows:
    # #    print row
    # conn.commit()

    character2 = "insert into exam(student_ID,exam_name,grade) values (%s,%s,%s)"
    data2=[('1', 'FirstExam', '62'),('1', 'SecondExam' ,'70'),('1', 'ThirdExam', '98'),
          ('1', 'FinalExam', '93'),('2', 'FirstExam', '46'),('2', 'SecondExam', '97'),
          ('2', 'ThirdExam', '68'),('2', 'FinalExam', '60'),('3', 'FirstExam', '64' ),
          ('3', 'SecondExam', '48'),('3', 'ThirdExam', '94'),('3', 'FinalExam', '68'),
          ('4', 'FirstExam', '69'),('4', 'SecondExam', '100'),('4', 'ThirdExam', '97'),
          ('4', 'FinalExam', '56' ),('5', 'FirstExam', '91'),('5', 'SecondExam', '86'),
          ('5', 'ThirdExam', '58'),('5', 'FinalExam', '81'),('6', 'FirstExam', '71'),
          ('6', 'SecondExam', '63'),('6' ,'ThirdExam', '96'),('6', 'FinalExam', '60' ),
          ('7', 'FirstExam', '60'),('7', 'SecondExam', '48'),('7', 'ThirdExam', '63'),
          ('7', 'FinalExam', '74'),('8', 'FirstExam', '86'),('8', 'SecondExam', '99'),
          ('8', 'ThirdExam', '73'),('8', 'FinalExam', '79'),('9', 'FirstExam', '94'),
          ('9', 'SecondExam', '61'),('9', 'ThirdExam', '49'),('9', 'FinalExam', '72' ),
          ('10', 'FirstExam', '62'),('10', 'SecondExam', '67'),('10', 'ThirdExam', '68'),
          ('10', 'FinalExam', '78'),('11' ,'FirstExam', '94'),('11', 'SecondExam', '60'),
          ('11', 'ThirdExam', '93'),('11', 'FinalExam', '60'),('12', 'FirstExam', '98'),
          ('12', 'SecondExam', '48'),('12', 'ThirdExam', '69'),('12', 'FinalExam', '86'),
          ('13', 'FirstExam' ,'46'),('13', 'SecondExam', '84'),('13', 'ThirdExam', '47'),
          ('13', 'FinalExam', '83' ),('14', 'FirstExam', '52'),('14', 'SecondExam', '97'),
          ('14', 'ThirdExam', '91'),('14', 'FinalExam', '84'),('15', 'FirstExam', '85'),
          ('15', 'SecondExam' ,'68'),('15', 'ThirdExam', '100'),('15', 'FinalExam', '52'),
          ('16', 'FirstExam', '59'),('16', 'SecondExam', '58'),('16', 'ThirdExam', '95'),
          ('16', 'FinalExam', '58'),('17', 'FirstExam', '92'),('17', 'SecondExam', '93'),
          ('17', 'ThirdExam', '100'),('17', 'FinalExam' ,'49' ),('18', 'FirstExam', '87'),
          ('18', 'SecondExam', '81'),('18', 'ThirdExam', '93'),('18', 'FinalExam', '58'),
          ('19', 'FirstExam', '85'),('19', 'SecondExam', '88'),('19', 'ThirdExam', '91'),
          ('19', 'FinalExam', '62'),('20', 'FirstExam', '88'),('20', 'SecondExam', '78'),
          ('20', 'ThirdExam', '94'),('20', 'FinalExam', '100') ]
    cur.executemany(character2,data2)
    cur.execute("select * from exam")
    # rows=cur.fetchall()
    # for row in rows:
    #    print row
    conn.commit()
