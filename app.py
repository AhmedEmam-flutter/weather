from flask import Flask, request, jsonify
import joblib
import numpy as np

app = Flask(__name__)

# Load the model using joblib (safer for sklearn)
model = joblib.load('random_forest_model.pkl')
print("✅ Model loaded successfully.")

@app.route('/')
def home():
    return "Welcome to the ML Prediction API!"

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json
    features = data['features']

    print('📥 Received Features:', features)

    if len(features) != 5:
        return jsonify({'error': 'Exactly 5 features required'}), 400

    features = np.array(features).reshape(1, -1)
    prediction = model.predict(features)

    label_map = {1: 'good', 0: 'bad'}
    predicted_label = label_map.get(int(prediction[0]), 'unknown')

    print('🔮 Prediction Sent to Flutter:', predicted_label)

    return jsonify({'prediction': predicted_label})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)
