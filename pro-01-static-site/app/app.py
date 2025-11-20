from flask import Flask, jsonify, request
import os

app = Flask(__name__)

@app.route('/api/v1/users', methods=['GET'])
def get_users():
    return jsonify({"message":"success get all"})

@app.route('/api/v1/users/<id>', methods=['GET'])
def get_user(id):
    return jsonify({"message": f'success get id: {id}'})

@app.route('/api/v1/users', method=['POST'])
def create_user():
    return jsonify({'message': 'success create'})

@app.route('/api/v1/users/<id>', method=['PUT'])
def update_user():
    return jsonify({'message': f'success update: {id}'})

@app.route('/api/v1/users/<id>', method=['DELETE'])
def delete_user():
    return jsonify({'message': f'success delete: {id}'})


if __name__== '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000) 