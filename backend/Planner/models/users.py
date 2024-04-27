from pydantic import BaseModel
from models.events import Event
from typing import Optional, List


class User(BaseModel):
    email : str
    password : str
    event : Optional[list[Event]]
    

class UserSingIn(BaseModel):
    email : str
    password : str
    