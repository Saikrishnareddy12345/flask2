from flask import Flask,redirect,render_template,request,url_for
from flask_mysqldb import  MySQL
import mysql.connector
app=Flask(__name__)
app.config['MYSQL_HOST']='database-1.cd7vy9vyykrt.ap-south-1.rds.amazonaws.com'  #your aws rds endpoint
app.config['MYSQL_USER']='admin'
app.config['MYSQL_PASSWORD']='Student#0509'
app.config['MYSQL_DB']='saidb'
mysql=MySQL(app)
@app.route('/',methods=['GET','POST'])
def index():
    if request.method=='POST':
        result=request.form.to_dict()
        name=request.form['name']
        physics=int(result['physics'])
        chemistry=int(result['chemistry'])
        maths = int(result['maths'])
        s = str(physics + chemistry + maths)
        result['total']=s
        total = result['total']
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO priyanka (name,physics,chemistry,maths,total) VALUES(%s,%s,%s,%s,%s)",(name,physics,chemistry,maths,total))
        mysql.connection.commit()
        cur.close()
        return redirect('/getting')
    return render_template("index.html")

@app.route('/getting')
def get():
    cur=mysql.connection.cursor()
    res=cur.execute("SELECT * FROM priyanka")
    if res>0:
        res1=cur.fetchall()
    return render_template("result.html",res1=res1)

if __name__=='__main__':
    app.run(debug=True,use_reloader=True,host='0.0.0.0',port=200)

