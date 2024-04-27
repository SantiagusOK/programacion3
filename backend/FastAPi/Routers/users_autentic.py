from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

users_Bd = {
    "santiagus":{
        "username" : "santiagus",
        "password" : "agus123",
        "activate" : False
    },
    "santiagus2":{
        "username" : "santiagus2",
        "password" : "agus456",
        "activate" : False
    },
    "santiagus3":{
        "username" : "santiagus3",
        "password" : "agus789",
        "activate" : False
    },
}

class User(BaseModel):
    username : str
    password : str
    state : bool