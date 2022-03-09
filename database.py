from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy import create_engine
from geoalchemy2 import Geometry
import psycopg2

Base = declarative_base()


class Vehicles(Base):
    __tablename__ = 'vehicles'
    pk = Column(Integer, primary_key=True)
    id = Column(Integer)
    trip_id = Column(String)
    route_name = Column(String)
    schedule_relationship = Column(String)
    stop_id = Column(String)
    loc = Column(Geometry(geometry_type='POINT'))
    lat = Column(String)
    lon = Column(String)
    bearing = Column(String)
    speed = Column(String)
    vehicle_timestamp = Column(String)
    vehicle_id = Column(String)
    current_stop_sequence = Column(Integer)
    current_status = Column(String)
    occupancy_status = Column(String)

class Predictions(Base):
    __tablename__ = 'predictions'
    id = Column(Integer, primary_key=True)
    stop_id = Column(Integer)
    trip_id = Column(Integer)
    vehicle_id = Column(Integer)
    route_name = Column(String)
    predicted_delay = Column(Integer)
    predicted_departure = Column(String)
    prediction_datetime = Column(String)


engine = create_engine('postgresql://postgres:buspass@74.207.224.142/transit')
