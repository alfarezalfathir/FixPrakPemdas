from flask import Flask, request, jsonify, render_template
from models import db, SoilSensor
import config

app = Flask(__name__)

# LOAD CONFIG
app.config.from_object(config)

# INIT DB
db.init_app(app)

with app.app_context():
    db.create_all()

@app.get("/")
def home():
    return {"message": "Flask jalan cuy ✔"}

# ===== DASHBOARD WEB =====
@app.get("/dashboard")
def dashboard():
    return render_template("dashboard.html")

# ===== GET DATA SOIL SENSOR =====
@app.get("/api/soil")
def get_soil():
    data = SoilSensor.query.order_by(
        SoilSensor.created_at.desc()
    ).first()

    if not data:
        return jsonify({"message": "Data belum ada"}), 404

    return jsonify(data.to_dict())

# ===== POST DATA SOIL SENSOR =====
@app.post("/api/soil")
def post_soil():
    payload = request.json
    moisture = payload.get("moisture")

    if moisture is None:
        return jsonify({"error": "moisture wajib diisi"}), 400

    soil = SoilSensor(moisture=moisture)

    db.session.add(soil)
    db.session.commit()

    return jsonify({
        "message": "Data soil berhasil disimpan",
        "data": soil.to_dict()
    }), 201

if __name__ == "__main__":
    app.run(debug=True)
