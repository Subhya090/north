from flask import Flask
from threading import Thread
import subprocess

app = Flask(__name__)

@app.route('/')
def index():
    return "Alive"

def run_flask():
    app.run(host='0.0.0.0', port=8080)

def run_bot():
    # Run sharp.py script in the background
    subprocess.Popen(["python", "sharp.py"])

def keep_alive():
    # Run both the Flask app and the bot
    t1 = Thread(target=run_flask)
    t2 = Thread(target=run_bot)
    t1.start()
    t2.start()
