from flask import Flask, jsonify, request

app = Flask(__name__)

# Definindo um recurso
@app.route('/api/v1/resource', methods=['GET'])
def get_resource():
    data = {
        'id': 1,
        'name': 'Resource Name',
        'description': 'This is a sample resource'
    }
    return jsonify(data)

# Adicionando um novo recurso
@app.route('/api/v1/resource', methods=['POST'])
def create_resource():
    new_data = request.get_json()
    return jsonify(new_data), 201

if __name__ == '__main__':
    app.run(debug=True)
