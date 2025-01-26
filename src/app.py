from flask import (
    Flask,
    jsonify
)
import os
import logging


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

APP_HOST = os.environ.get('APP_HOST', '0.0.0.0')
APP_PORT = int(os.environ.get('APP_PORT', 8000))
APP_VERSION = os.environ.get('APP_VERSION', 'latest')

app = Flask(__name__)

@app.route('/')
def hello_world():
    logger.info('Hello World endpoint was called')
    
    return jsonify({
        "status": "healthy",
        "message": "Hello, World!",
        "version": APP_VERSION
    })

if __name__ == '__main__':
    logger.info(f'Starting application on port {APP_PORT}')
    app.run(host=APP_HOST, port=APP_PORT, debug=False)
