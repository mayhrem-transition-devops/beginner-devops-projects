from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello_world():
    version = os.environ.get("APP_VERSION", "1.0.0")
    return f'<h1>Hello from the DevOps Container</h1><p>Version: {version}</p>'

if __name__== '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)