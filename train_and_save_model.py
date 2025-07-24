# train_and_save_model.py

import numpy as np
from sklearn.ensemble import RandomForestClassifier
import joblib

# Example: X_train should have 5 binary features (0/1)
X_train = np.array([
    [1, 0, 1, 0, 1],
    [0, 1, 0, 1, 0],
    [1, 0, 0, 1, 1],
    [0, 1, 1, 0, 0],
])
y_train = np.array([0, 1, 1, 0])  # 0=bad, 1=good

model = RandomForestClassifier()
model.fit(X_train, y_train)

joblib.dump(model, 'random_forest_model.pkl')
print("✅ Model retrained and saved with joblib.")
