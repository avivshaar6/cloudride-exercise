from flask import Flask
import os
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

APP_PORT = int(os.environ.get('APP_PORT', 8000))

app = Flask(__name__)

@app.route('/')
def hello_world():
    logger.info('Hello World endpoint was called')
    # return 'Hello, World!'
    return 'Hello, World! 10'

if __name__ == '__main__':
    logger.info(f'Starting application on port {APP_PORT}')
    app.run(host='0.0.0.0', port=APP_PORT, debug=False)



