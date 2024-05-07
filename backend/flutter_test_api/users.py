from fastapi import APIRouter, HTTPException, status
from users_models import Users

users_router = APIRouter(tags=["Users"])

name_list = [
    Users(name="Agustin", age=21)
]

@users_router.post("/new", status_code=201)
async def crete_user(user : Users):
    name_list.append(user)
    
    
@users_router.get("/all", status_code=200)
async def crete_user():
    return name_list