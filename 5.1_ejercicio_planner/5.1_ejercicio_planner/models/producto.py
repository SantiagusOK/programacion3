from pydantic import BaseModel
from typing import Optional

class Producto():
    id: int 
    nombre : str
    categoria : str
    descripcion : str
    precio : float
    stock : int
    stock_minimo : int
    stock_maximo : int
    activo : bool
    
    def __init__(self,id,nombre,categoria,descripcion,precio,stock,stock_minimo,stock_maximo,activo):
        self.id = id
        self.nombre = nombre
        self.categoria = categoria
        self.descripcion = descripcion
        self.precio = precio
        self.stock = stock
        self.stock_minimo = stock_minimo
        self.stock_maximo = stock_maximo
        self.activo = activo



class ProductoBase(BaseModel):
    id: int 
    nombre : str
    categoria : str
    descripcion : str
    precio : float
    stock : int
    stock_minimo : int
    stock_maximo : int
    activo : bool