from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy import String, Boolean, Table, ForeignKey
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import String, Boolean
from sqlalchemy.orm import Mapped, mapped_column

db = SQLAlchemy()


class Country(db.Model):
    __tablename__ = 'countries'
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(50), unique=True, nullable=False)
    continent: Mapped[str] = mapped_column(
        String(80), nullable=False, default='Unknown')
    population: Mapped[int] = mapped_column(nullable=False, default=0)

    manufacturers = relationship("Manufacturer", back_populates="country")

    def __repr__(self):
        return f'<Country {self.name}>'

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "continent": self.continent,
            "population": self.population
        }


class Manufacturer(db.Model):
    __tablename__ = 'manufacturers'
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(100), unique=True, nullable=False)
    founded_year: Mapped[int] = mapped_column(nullable=True)
    country_id: Mapped[int] = mapped_column(ForeignKey('countries.id'))

    country = relationship("Country", back_populates="manufacturers")

    def __repr__(self):
        return f'<Manufacturer {self.name}>'

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "country_id": self.country_id,
            "country": self.country.serialize() if self.country else None
        }


# Association table for many-to-many relationship between Car and Feature

class Paren(db.Model):
    __tablename__ = 'parents'
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(100), unique=True, nullable=False)

    children = relationship("Child", back_populates="parent", uselist=True)

    def __repr__(self):
        return f'<Parent {self.name}>'

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name
        }


class Child(db.Model):
    __tablename__ = 'children'
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(100), unique=True, nullable=False)
    parent_id: Mapped[int] = mapped_column(ForeignKey('parents.id'))

    parent = relationship("Paren", back_populates="children")

    def __repr__(self):
        return f'<Child {self.name}>'

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "parent_id": self.parent_id,
            "parent": self.parent.serialize() if self.parent else None
        }


# Association table for many-to-many relationship between Car and Feature

customer_product = Table(
    'customer_product',
    db.Model.metadata,
    mapped_column('customer_id', ForeignKey('customers.id'), primary_key=True),
    mapped_column('product_id', ForeignKey('products.id'), primary_key=True)
)


class Customer(db.Model):
    __tablename__ = 'customers'
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(100), unique=True, nullable=False)
    email: Mapped[str] = mapped_column(
        String(120), unique=True, nullable=False)
    is_active: Mapped[bool] = mapped_column(Boolean, default=True)

    products = relationship(
        "Product",
        secondary=customer_product,
        back_populates="customers"
    )

    def __repr__(self):
        return f'<Customer {self.name}>'

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "email": self.email,
            "is_active": self.is_active
        }


class Product(db.Model):
    __tablename__ = 'products'
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(100), unique=True, nullable=False)
    price: Mapped[float] = mapped_column(nullable=False, default=0.0)
    in_stock: Mapped[bool] = mapped_column(Boolean, default=True)

    customers = relationship(
        "Customer",
        secondary=customer_product,
        back_populates="products"
    )

    def __repr__(self):
        return f'<Product {self.name}>'

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "price": self.price,
            "in_stock": self.in_stock
        }


# Association table for one-to-many relationship between Author and Book

class User(db.Model):
    __tablename__ = 'users'
    id: Mapped[int] = mapped_column(primary_key=True)
    username: Mapped[str] = mapped_column(
        String(80), unique=True, nullable=False)
    email: Mapped[str] = mapped_column(
        String(120), unique=True, nullable=False)

    posts = relationship("Post", back_populates="author")

    def __repr__(self):
        return f'<User {self.username}>'

    def serialize(self):
        return {
            "id": self.id,
            "username": self.username,
            "email": self.email
        }


class Post(db.Model):
    __tablename__ = 'posts'
    id: Mapped[int] = mapped_column(primary_key=True)
    title: Mapped[str] = mapped_column(String(200), nullable=False)
    content: Mapped[str] = mapped_column(nullable=False)
    user_id: Mapped[int] = mapped_column(ForeignKey('users.id'))

    author = relationship("User", back_populates="posts")

    def __repr__(self):
        return f'<Post {self.title}>'

    def serialize(self):
        return {
            "id": self.id,
            "title": self.title,
            "content": self.content,
            "user_id": self.user_id,
            "author": self.author.serialize() if self.author else None
        }
