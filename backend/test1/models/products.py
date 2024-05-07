from pydantic import BaseModel


class Products:
    def __init__(self, id: int, name: str, price: int):
        self.id = id
        self.name = name
        self.price = price

class PedirProducts(BaseModel):
    id : int
    name : str
    price : int