from fastapi import APIRouter, HTTPException, status

from models.User import User

user_router = APIRouter(tags=["User"])

user_bd = []

@user_router.get("/all")
async def get_all_user():
    index_total = len(user_bd)
    if index_total == 0:
        raise HTTPException(
            status.HTTP_404_NOT_FOUND,
            detail="No hay usuarios registrados"
        )
    else:
        return user_bd
        

@user_router.post("/register")
async def register_a_user(new_user : User):

    for user in user_bd:
        if new_user.username == user.username:
            raise HTTPException(
                status.HTTP_302_FOUND,
                detail="El usuario ya esta registrado"
            )
    
    user_bd.append(new_user)

@user_router.post("/login")
async def login_a_user(data : User):
   
   for user in user_bd:
       if user.username == data.username and user.password == data.password:
           raise HTTPException(
            status.HTTP_200_OK,
            detail=f"Bienvenido {data.username}")
    

    
    
    