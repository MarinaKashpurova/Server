import bottle
from bottle import static_file, template
from bottle.ext import sqlite
import time
from datetime import datetime


app = bottle.Bottle()
sqlitePlugin = sqlite.Plugin(dbfile='data.db')
app.install(sqlitePlugin)


@app.get("/css/<filepath:re:.*\.css>")
def css(filepath):
    return static_file(filepath, root="css")

@app.get("/img/<filepath:re:.*\.(jpg|gif|png|ico|JPG)>")
def img(filepath):
    return static_file(filepath, root="img")

@app.get("/js/<filepath:re:.*\.js>")
def js(filepath):
    return static_file(filepath, root="js")


@app.get('/')
@app.get('/index.html')
def main(db):
    return visitors_count(db, 'index')

@app.get('/gallery.html')
def main(db):
    return visitors_count(db, 'gallery')

def visitors_count(db, page):
    ip = bottle.request.environ.get('REMOTE_ADDR')
    base = db.cursor()
    base.execute("select lastTime from visitors where ip = '{}'".format(ip))
    return template(page, all=getAll(base), lastTime=getLastTime(db, base, ip), today=getTodayVisitors(base))

def getDate():
    return round(time.mktime(datetime.date(datetime.now()).timetuple()))

def getLastTime(db,data, ip):
    if (data.fetchone() != ''):
        lastTime = time.ctime(int(data.execute("select lastTime from visitors where ip = '{}'".format(ip)).fetchone()[0]))
        data.execute("update visitors set lastTime=({}) WHERE ip = ('{}')".format(round(time.time()), ip))
    else:
        lastTime = 'Никогда'
        data.execute("insert into visitors ('ip', 'lastTime') VALUES ('{}', '{}')".format(ip, round(time.time())))
    db.commit()
    return lastTime

def getAll(data):
    all = data.execute("select count(*) from visitors").fetchone()[0]
    return all

def getTodayVisitors(data):
    today = data.execute("select count(*) from visitors where lastTime >= '{}'".format(getDate())).fetchone()[0]
    return today

@app.get('/recall.html')
def main(db):
    return getAllMessages(db)

@app.post('/recall.html')
def sendMessage(db):
    author = bottle.request.forms.get("author")
    message = bottle.request.forms.get("message")
    intAuth = len(str(author))
    intMes = len(str(message))
    if (intAuth>50 or intMes>200):
        return getAllMessages(db)
    if not all([author, message]):
        return getAllMessages(db)
    db.execute("insert into messages (author, text, time) values (?,?,?)",(author, message, int(time.time())))
    db.commit()
    return getAllMessages(db)


def getAllMessages(db):
    messages = db.execute('select author, text from messages order by time desc').fetchall()
    return template('recall', messages=messages)

if __name__ == "__main__":
    app.run(host='localhost', port=8080, debug= True, reloader=True)