from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy import String, Boolean, Table, ForeignKey
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import String, Boolean
from sqlalchemy.orm import Mapped, mapped_column

db = SQLAlchemy()


db = SQLAlchemy()

# Tabla de asociación para la relación muchos a muchos
video_game_platform = Table(
    'video_game_platform',
    db.metadata,
    db.Column('video_game_id', db.Integer, ForeignKey(
        'video_game.id', ondelete='CASCADE'), primary_key=True),
    db.Column('platform_id', db.Integer, ForeignKey(
        'platform.id', ondelete='CASCADE'), primary_key=True)
)


class Country(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(100), unique=True, nullable=False)
    continent: Mapped[str] = mapped_column(String(50))
    population: Mapped[int] = mapped_column(db.BigInteger, nullable=True)

    manufacturers = relationship(
        'Manufacturer', back_populates='country', lazy=True)
    development_companies = relationship(
        'DevelopmentCompany', back_populates='country', lazy=True)

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "continent": self.continent,
            "population": self.population,
        }

    validate_population = db.validates('population')

    def validate_population(self, key, value):
        if value is not None and value < 0:
            raise ValueError("Population must be a non-negative integer")
        return value


class Manufacturer(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(100), unique=True, nullable=False)
    country_id: Mapped[int] = mapped_column(
        db.ForeignKey('country.id', ondelete='SET NULL'), nullable=True)
    founded_year: Mapped[int] = mapped_column(nullable=True)

    country = relationship('Country', back_populates='manufacturers')
    platforms = relationship(
        'Platform', back_populates='manufacturer', lazy=True)

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "country_id": self.country_id,
            "founded_year": self.founded_year,
        }


class Platform(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(80), unique=True, nullable=False)
    manufacturer_id: Mapped[int] = mapped_column(
        db.ForeignKey('manufacturer.id', ondelete='SET NULL'), nullable=True)
    hardware_price: Mapped[float] = mapped_column(
        db.Numeric(10, 2), nullable=True)

    manufacturer = relationship('Manufacturer', back_populates='platforms')
    video_games = relationship(
        'VideoGame',
        secondary=video_game_platform,
        back_populates='platforms',
        lazy='dynamic'
    )

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "manufacturer_id": self.manufacturer_id,
            "hardware_price": float(self.hardware_price) if self.hardware_price is not None else None,
        }


class DevelopmentCompany(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(100), unique=True, nullable=False)
    country_id: Mapped[int] = mapped_column(
        db.ForeignKey('country.id', ondelete='SET NULL'), nullable=True)
    founded_year: Mapped[int] = mapped_column(nullable=True)

    country = relationship('Country', back_populates='development_companies')
    video_games = relationship(
        'VideoGame', back_populates='company', lazy=True)

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "country_id": self.country_id,
            "founded_year": self.founded_year,
        }


class VideoGame(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(150), nullable=False)
    genre: Mapped[str] = mapped_column(String(50), nullable=True)
    release_year: Mapped[int] = mapped_column(nullable=True)
    rating: Mapped[str] = mapped_column(String(10), nullable=True)
    company_id: Mapped[int] = mapped_column(
        db.ForeignKey('development_company.id', ondelete='SET NULL'), nullable=True)

    company = relationship('DevelopmentCompany', back_populates='video_games')
    platforms = relationship(
        'Platform',
        secondary=video_game_platform,
        back_populates='video_games',
        lazy='dynamic'
    )

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "genre": self.genre,
            "release_year": self.release_year,
            "rating": self.rating,
            "company_id": self.company_id,
        }
