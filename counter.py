from flask import Flask
import os

app = Flask(__name__)

COUNTER_FILE = "/data/current_count"  # Or any persistent location

def get_next_counter():
    try:
        with open(COUNTER_FILE, "r") as f:
            count = int(f.read().strip())
    except FileNotFoundError:
        count = 0

    next_count = count + 1
    with open(COUNTER_FILE, "w") as f:
        f.write(str(next_count))
    return f"{next_count}" # next_count:05d

@app.route("/next")
def next_counter():
    return get_next_counter()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=4114) # Listen on all interfaces
