from fastapi import APIRouter, HTTPException, status
from models.User import User, UserRequest

user_router = APIRouter(tags=["User"])

users_list = [
    User("santiagus", 1234, ["palo", "basura"]),
    User("horacion123", 123, ["pistola", "basuta"]),
    User("AlexLeon", 124124,["basura", "tierra"])
]

@user_router.get("/getall")
async def get_all_user():
    return users_list

@user_router.post("/new")
async def add_new_user(new_user : UserRequest):
    for user in users_list:
        if user.username == new_user.username:
            raise HTTPException(
                status.HTTP_302_FOUND,
                detail=f"El usaurio {new_user.username} ya esta en la lista")
            
    new_new_user = User(**new_user.model_dump())
    users_list.append(new_new_user)
    
    raise HTTPException(
        status.HTTP_200_OK,
        detail=f"El usaurio {new_user.username} agregado con exito")

@user_router.post("/login")
async def login_user(user_login : UserRequest):
    for user in users_list:
        if user.username == user_login.username and user.password == user_login.password:
            raise HTTPException(
                status.HTTP_200_OK,
                detail=f"Bienvenido {user_login.username}")
    
    raise HTTPException(
        status.HTTP_404_NOT_FOUND,
        detail=f"El nombre de usuario o contraseña mal colocadas")


@user_router.delete("/delete/{nombre_user}")
async def delete_a_user(nombre_user : str):
    for index, user in enumerate(users_list):
        if user.username == nombre_user:
            users_list.pop(index)
            raise HTTPException(
                status.HTTP_200_OK,
                detail=f"Usuario {nombre_user} fue eliminado exitosamente")
    
    raise HTTPException(
        status.HTTP_404_NOT_FOUND,
        detail=f"El usuario {nombre_user} no esta en la lista")


@user_router.put("/update/{name_user}")
async def update_a_user(name_user : str, user_data : UserRequest):
    for i, user in enumerate(users_list):
        if user.username == name_user:
            user_update = User(**user_data.model_dump())
            users_list[i] = user_update
            
            raise HTTPException(
                status.HTTP_200_OK,
                detail=f"Los datos fueron actualizados para: {name_user}")

    raise HTTPException(
        status.HTTP_404_NOT_FOUND,
        detail=f"El usuario {name_user} no esta en la lista")


@user_router.post("/additem/{user_name}/{item_name}")
async def add_new_item(user_name : str, item_name : str):
    for user in users_list:
        if user.username == user_name:
            user.items.append(item_name)
            raise HTTPException(
                status.HTTP_200_OK,
                detail=f"Se agrego el item {item_name} a la mochila de {user.username}")

    raise HTTPException(
                status.HTTP_404_NOT_FOUND,
                detail=f"no existe el usuario {user_name}")

@user_router.delete("/deleteAI/{item_name}")
async def delete_item_all(item_name : str):
    item_removido : int = 0
    for user in users_list:
        for i,item in enumerate(user.items):
            if item == item_name:
                user.items.pop(i)
                item_removido += 1
    
    if item_removido > 0:
        raise HTTPException(
            status.HTTP_200_OK,
            detail=f"Se han eliminado todos los {item_name} de todos los usuarios")
    
    else:
        raise HTTPException(
            status.HTTP_404_NOT_FOUND,
            detail=f"No hay {item_name} en los inventarios de los usuarios")