from pydantic import BaseModel

class User():
    def __init__(self, username : str, password: str, items: list):
        self.username = username
        self.password = password
        self.items = items
    
class UserRequest(BaseModel):
    username : str
    password : int
    
    class Config:
        schema_extra = {
            "example": {
                "username" : "santiagus315",
                "password" : 12345
            }
        }