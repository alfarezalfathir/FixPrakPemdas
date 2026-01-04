# MODELS
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class SoilSensor(db.Model):
    __tablename__ = "moisture"

    id = db.Column(db.Integer, primary_key=True)
    moisture = db.Column(db.Integer)  # persen kelembaban tanah
    created_at = db.Column(db.DateTime, default=db.func.now())

    def to_dict(self):
        return {
            "id": self.id,
            "moisture": self.moisture,
            "created_at": self.created_at.strftime("%Y-%m-%d %H:%M:%S")
        }
