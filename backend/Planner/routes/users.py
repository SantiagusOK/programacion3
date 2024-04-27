from fastapi import APIRouter, HTTPException, status
from models.users import User, UserSingIn


user_router = APIRouter(
    tags=["User"])

users = {}

@user_router.get("/getall")
async def get_all_user():
    return users

@user_router.post("/signup")
async def sing_user_up(user : User):
    if user.email in users:
        raise HTTPException(
            status.HTTP_302_FOUND,
            detail="el usuario ya existe"
        )
        
    users[user.email] = user
    
    return {
        "message" : "Usuario creado con exito"
    }
    
@user_router.post("/signin")
async def sing_user_in(user : UserSingIn):
    if user.email not in users:
        raise HTTPException(
            status.HTTP_404_NOT_FOUND,
            detail="El usuario no existe"
        )
    
    if users[user.email].password != user.password:
        raise HTTPException(
            status.HTTP_406_NOT_ACCEPTABLE,
            detail="La contraseña está mal"
        )
        
        
    return {
        "message" : f"Usuario {user.email} logeado con exito"
    }