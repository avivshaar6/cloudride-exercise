from flask import (
    Flask,
    request,
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
    try:
        logger.info(f'Hello World endpoint was called with path {request.path}')
        
        return jsonify({
            "status_code": 200,
            "path": request.path,
            "status": "healthy",
            "message": "Hello, World!",
            "version": APP_VERSION
        }), 200
    
    except Exception as e:
        logger.error(f'Error calling Hello World endpoint with path {request.path}: {e}')
        
        return jsonify({
            "status_code": 500,
            "path": request.path,
            "status": "unhealthy",
            "message": "Error calling Hello World endpoint",
            "version": APP_VERSION
        }), 500
    
@app.errorhandler(404)
def not_found(error):
    logger.error(f'Path {request.path} not found: {error}')
    
    return jsonify({
        "status_code": 404,
        "path": request.path,
        "status": "error",
        "message": "Path not found",
        "version": APP_VERSION
    }), 404


if __name__ == '__main__':
    try:    
        logger.info(f'Starting application on port {APP_PORT}')
        app.run(host=APP_HOST, port=APP_PORT, debug=False)
    
    except Exception as e:
        logger.error(f'Error starting application: {e}')
        raise e
