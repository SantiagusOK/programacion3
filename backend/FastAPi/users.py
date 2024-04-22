from fastapi import FastAPI
from pydantic import BaseModel
app  = FastAPI()

#entidad users
class users(BaseModel):
    name: str
    age: int
    
users_bd = [users(name='Santi', age=22),
            users(name='Agus', age=23),
            users(name='Santiago', age=24)]



@app.get('/usersjson')
async def users():
    return users_bd