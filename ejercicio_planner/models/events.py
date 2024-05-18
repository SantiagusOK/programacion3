from typing import List
from pydantic import BaseModel
from sqlmodel import JSON, SQLModel, Field, Column   


class Event(SQLModel, table=True):
    id: int = Field(default=None, primary_key=True)
    title: str
    image: str
    description: str
    tags: List[str] = Field(sa_column=Column(JSON))
    location: str
    
    
class EventBody(SQLModel):
    title : str
    image : str
    description : str
    tags : List[str]
    location : str
    
