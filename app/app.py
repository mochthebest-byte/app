from flask import Flask

app = Flask(__name__)

@app.get("/")
def hello():
    return "Hello from Docker + GHCR!"

if __name__ == "__main__":
    # important: listen on all interfaces inside container
    app.run(host="0.0.0.0", port=5000)
