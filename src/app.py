from flask import Flask
import os
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = Flask(__name__)

@app.route('/')
def hello_world():
    logger.info('Hello World endpoint was called')
    # return 'Hello, World!'
    return 'Hello, World! 2'

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8000))
    logger.info(f'Starting application on port {port}')
    app.run(host='0.0.0.0', port=port, debug=False)
