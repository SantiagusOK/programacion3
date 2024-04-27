from pydantic import BaseModel


class User(BaseModel):
    name : str
    age : int
    
class UserAge(BaseModel):
    age : int
    class Config:
        schema_extra={
            "example":{
                "age" : "edad"
            }
        }