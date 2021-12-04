import mysql.connector
from datetime import date
import pandas as pd
from pandas.core.frame import DataFrame
try:
    myconn=mysql.connector.connect(host="localhost",user="root",passwd="",database="sms")
except:
    print("Try again")
mycur=myconn.cursor()
def insertstudent():
    try:
        studid=int(input("Enter studentid: "))
        studname=input("Enter the studentname: ")
        classs=int(input("Enter the class: "))
        section=input("Enter the setcion: ")
        roll=int(input("Enter the roll: "))
        dob=list(map(int,input("Enter dob like YYYY-MM-DD: ").split("-")))
        schoolid=input("Enter schoolid: ")
        query="INSERT INTO student(studid, studname, class, section, rollno, dob, schoolid) VALUES (%s,%s,%s,%s,%s,%s,%s)"
        val=(studid,studname,classs,section,roll,date(dob[0],dob[1],dob[2]),schoolid)
        mycur.execute(query,val)
        myconn.commit()
        print(mycur.rowcount,"Record inserted!")
        mycur.execute("SELECT * FROM student")
        res=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=pd.DataFrame(res,index=None,columns=fieldnames)
        print(df)
    except:
        print("Could'nt insert into student table")
def insertfaculty():
    try:
        facid=int(input("Enter facid: "))
        facname=input("Enter the facname: ")
        dob=list(map(int,input("Enter dob like YYYY-MM-DD: ").split("-")))
        print(dob)
        salary=int(input("Enter salary: "))
        schoolid=input("Enter schoolid: ")
        query="INSERT INTO faculty(facid,facname,dob,salary,schoolid) VALUES (%s,%s,%s,%s,%s)"
        val=(facid,facname,date(dob[0],dob[1],dob[2]),salary,schoolid)
        mycur.execute(query,val)
        myconn.commit()
        print(mycur.rowcount,"Record inserted!")
        mycur.execute("SELECT * FROM faculty")
        res=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=pd.DataFrame(res,index=None,columns=fieldnames)
        print(df)
    except:
        print("could not insert into faculty table")
def insertsubject():
    try:
        subid=int(input("Enter subid: "))
        subname=input("Enter the subname: ")
        query="INSERT INTO subjects(subid,subname) VALUES (%s,%s)"
        val=(subid,subname)
        mycur.execute(query,val)
        myconn.commit()
        print(mycur.rowcount,"Record inserted!")
        mycur.execute("SELECT * FROM subjects")
        res=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=pd.DataFrame(res,index=None,columns=fieldnames)
        print(df)
    except:
        print("could not insert into subjects table")
def insertschool():
    try:
        schoodid=input("Enter schoolid: ")
        schoolname=input("Enter school name: ")
        location=input("Enter school location: ")
        query="INSERT INTO school(schoolid,schoolname,location) VALUES(%s,%s,%s)"
        val=(schoodid,schoolname,location)
        mycur.execute(query,val)
        myconn.commit()
        print(mycur.rowcount,"Record inserted!")
        mycur.execute("SELECT * FROM school")
        result=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=DataFrame(result,index=None,columns=fieldnames)
        print(df)
    except:
        print("could not insert into school table")
def insertfacsub():
    try:
        facid=int(input("Enter facid: "))
        subid=int(input("Enter subid: "))
        query="INSERT INTO facsub(facid,subid) VALUES(%s,%s)"
        val=(facid,subid)
        mycur.execute(query,val)
        myconn.commit()
        print(mycur.rowcount,"Record inserted!")
        mycur.execute("SELECT * FROM facsub")
        result=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=DataFrame(result,index=None,columns=fieldnames)
        print(df)
    except:
        print("could not insert into facsub table")
def insertteachesto():
    try:
        facid=int(input("Enter facid: "))
        studid=int(input("Enter studid: "))
        course=input("Enter course name: ")
        query="INSERT INTO teachesto(facid,studid,course) VALUES(%s,%s,%s)"
        val=(facid,studid,course)
        mycur.execute(query,val)
        myconn.commit()
        print(mycur.rowcount,"Record inserted!")
        mycur.execute("SELECT * FROM teachesto")
        result=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=DataFrame(result,index=None,columns=fieldnames)
        print(df)
    except:
        print("could not insert into teachesto table")
def viewstudent():
    try:
        mycur.execute("SELECT * FROM student")
        res=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=pd.DataFrame(res,index=None,columns=fieldnames)
        print(df)
    except:
        print("could not display student table")
def viewfaculty():
    try:
        mycur.execute("SELECT * FROM faculty")
        res=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=pd.DataFrame(res,index=None,columns=fieldnames)
        print(df)
    except:
        print("could not display faculty table")
def viewschool():
    try:    
        mycur.execute("SELECT * FROM school")
        res=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=pd.DataFrame(res,index=None,columns=fieldnames)
        print(df)
    except:
        print("could not display school table")
def viewfacsub():
    try:
        mycur.execute("SELECT * FROM facsub")
        res=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=pd.DataFrame(res,index=None,columns=fieldnames)
        print(df)
    except:
        print("could not display facsub table")
def teachesto():
    mycur.execute("SELECT * FROM teachesto")
    res=mycur.fetchall()
    fieldnames=[i[0] for i in mycur.description]
    df=pd.DataFrame(res,index=None,columns=fieldnames)
    print(df)
def viewsubjects():
    try:
        mycur.execute("SELECT * FROM subjects")
        res=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=pd.DataFrame(res,index=None,columns=fieldnames)
        print(df)
    except:
        print("could not display subjects table")
def viewteachesto():
    try:
        mycur.execute("SELECT * FROM teachesto")
        res=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=pd.DataFrame(res,index=None,columns=fieldnames)
        print(df)
    except:
        print("could not display teachesto table")
def droptable(tablename):
    try:
        query="Drop Table "+tablename
        mycur.execute(query)
        print(tablename+" has been dropped")
    except:
        print("could not drop "+tablename)
def deletetablevals(tablename):
    try:
        query="Delete FROM "+tablename
        print(tablename+" rows have been deleted")
        mycur.execute(query)
        mycur.execute("SELECT * FROM "+tablename)
        res=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=pd.DataFrame(res,index=None,columns=fieldnames)
        print(df)
    except:
        print("could not delete from table "+tablename)
def deletetablevalwhere(tablename):
    try:
        mycur.execute("SELECT * FROM "+tablename)
        res=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=pd.DataFrame(res,index=None,columns=fieldnames)
        print(df)
        condition=input("Enter the condition ex: studid=101 ")
        query="Delete FROM "+tablename+" where "+condition
        mycur.execute(query)
        myconn.commit()
        mycur.execute("SELECT * FROM "+tablename)
        res=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=pd.DataFrame(res,index=None,columns=fieldnames)
        print(df)
        print("Row where "+condition+" has been deleted")
    except:
        print("could not delete from table "+tablename)
def updateval(tablename):
    try:
        mycur.execute("SELECT * FROM "+tablename)
        res=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=pd.DataFrame(res,index=None,columns=fieldnames)
        print(df)
        condition=input("Enter the condition ex: studid=101 ")
        query="UPDATE "+tablename+" SET "+input("Enter the column you want to change: ")+"="+'"'+input("Enter the new value")+'"'+" WHERE "+condition
        print(query)
        mycur.execute(query)
        myconn.commit()
        print("Updation finished")
        mycur.execute("SELECT * FROM "+tablename)
        res=mycur.fetchall()
        fieldnames=[i[0] for i in mycur.description]
        df=pd.DataFrame(res,index=None,columns=fieldnames)
        print(df)
    except:
        print("Updation of record in table "+tablename+" failed")
def main():
    while True:
        print("1.Insert\n2.Updation\n3.Display\n4.Delete all values\n5.Delete certain values\n6.Drop table\n7.Exit")
        operation=int(input("Enter operation: "))
        if operation==1:
            print("1.School\n2.Student\n3.Faculty\n4.Subject\n5.Faculty subjects\n6.Teaches to")
            table=input("select table: ")
            if table=="Student":
                insertstudent()
            if table=="Faculty":
                insertfaculty()
            if table=="Subject":
                insertsubject()
            if table=="School":
                insertschool()
            if table=="Faculty subjects":
                insertfacsub()
            if table=="Teaches to":
                insertteachesto()
        if operation==2:
            print("1.School\n2.Student\n3.Faculty\n4.Subject\n5.Faculty subjects\n6.Teaches to")
            table=input("select table: ")
            if table=="School":
                updateval("school")
            if table=="Student":
                updateval("student")
            if table=="Faculty":
                updateval("faculty")
            if table=="Subject":
                updateval("subjects")
            if table=="Faculty Subjects":
                updateval("facsub")
            if table=="Teaches To":
                updateval("teachesto")
            
        if operation==3:
            print("1.School\n2.Student\n3.Faculty\n4.Subject\n5.Faculty subjects\n6.Teaches to")
            table=input("select table: ")
            if table=="School":
                viewschool()
            if table=="Student":
                viewstudent()
            if table=="Faculty":
                viewfaculty()
            if table=="Subject":
                viewsubjects()
            if table=="Faculty Subjects":
                viewfacsub()
            if table=="Teaches To":
                viewteachesto()
        if operation==4:
            print("1.School\n2.Student\n3.Faculty\n4.Subject\n5.Faculty subjects\n6.Teaches to")
            table=input("select table: ")
            if table=="School":
                deletetablevals("school")
            if table=="Student":
                deletetablevals("student")
            if table=="Faculty":
                deletetablevals("faculty")
            if table=="Subject":
                deletetablevals("subjects")
            if table=="Faculty Subjects":
                deletetablevals("facsub")
            if table=="Teaches To":
                deletetablevals("teachesto")
        if operation==5:
            print("1.School\n2.Student\n3.Faculty\n4.Subject\n5.Faculty subjects\n6.Teaches to")
            table=input("select table: ")
            if table=="School":
                deletetablevalwhere("school")
            if table=="Student":
                deletetablevalwhere("student")
            if table=="Faculty":
                deletetablevalwhere("faculty")
            if table=="Subject":
                deletetablevalwhere("subjects")
            if table=="Faculty Subjects":
                deletetablevalwhere("facsub")
            if table=="Teaches To":
                deletetablevalwhere("teachesto")
        if operation==6:
            print("1.School\n2.Student\n3.Faculty\n4.Subject\n5.Faculty subjects\n6.Teaches to")
            table=input("select table: ")
            if table=="School":
                droptable("school")
            if table=="Student":
                droptable("student")
            if table=="Faculty":
                droptable("faculty")
            if table=="Subject":
                droptable("subjects")
            if table=="Faculty Subjects":
                droptable("facsub")
            if table=="Teaches To":
                droptable("teachesto")
        if operation==7:
            break
if __name__=="__main__":
    main()