from flask import Flask, render_template, request, redirect, url_for
import psycopg2
app = Flask(__name__)




connection = psycopg2.connect(
    user = 'postgres',
    password = 'postgres',
    host = 'localhost',
    port = '5432',
    database = 'postgres'
)

cursor = connection.cursor()


def get_items():
    cursor.execute("SELECT * FROM item")
    items = cursor.fetchall()
    return items

def add_item(name, anzahl, pakete, standort, fb_type, item_type):
    try:
        # Konvertiere leere Strings zu 0 für numerische Werte
        anzahl = anzahl if anzahl != '' else None
        pakete = pakete if pakete != '' else None
        standort = standort if standort != '' else None

        sql = "INSERT INTO item (name, anzahl, pakete, standort, fb_type, item_type) VALUES (%s, %s, %s, %s, %s, %s)"
        values = (name, anzahl, pakete, standort, fb_type, item_type)

        cursor.execute(sql, values)
        connection.commit()
    except Exception as e:
        connection.rollback()  # Rollback bei einem Fehler
        raise e


def remove_item(id):
    cursor.execute(f"DELETE FROM item WHERE id = {id}")
    connection.commit()
@app.route("/")
def hello_world():
 #   return get_items()
    return render_template("index.html", items=get_items())


@app.route("/add", methods=['GET', 'POST'])
def add():
    if request.method == 'POST':
        # Formulardaten abrufen
        name = request.form['name']
        anzahl = request.form['anzahl']
        pakete = request.form['paket']
        standort = request.form['standort']
        fb_type = request.form['fb']
        item_type = request.form['item_type']

        # Item zur Datenbank hinzufügen
        add_item(name, anzahl, pakete, standort, fb_type, item_type)

        # Zurück zur Hauptseite leiten
        return redirect(url_for('hello_world'))

    # GET-Request zeigt das Formular
    return render_template("add.html")

@app.route("/task")
def task():
    return render_template("task.html")
    