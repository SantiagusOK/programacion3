from pydantic import BaseModel
from typing import List


class Event(BaseModel):
    
    id : int
    title : str
    image : str
    description : str
    tags : list[str]
    location : str