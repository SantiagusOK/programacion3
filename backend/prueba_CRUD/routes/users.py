from fastapi import APIRouter, HTTPException, status
from models.users import User, UserAge

router = APIRouter()

name_bd = []

# Devolver todos los nombres de la db
@router.get("/name")
async def get_name():
    return name_bd

# Devolver un nombre de la bd por su nombre
@router.get("/name/{name_user}")
async def get_one_name(name_user : str):
    for names in name_bd:
        if names.name == name_user:
            return names
    
    raise HTTPException(
        status.HTTP_404_NOT_FOUND,
        detail=f"No se encontro el nombre {name_user} en la lista bd")

# Añade un nuevo usuario a la lista
@router.post("/name")
async def add_new_name(newUser : User):
    
    for names in name_bd:
        if names.name == newUser.name:
            raise HTTPException(
                status.HTTP_302_FOUND,
                detail=f"El nombre {newUser.name} ya esta en la lista db"
            )
    
    name_bd.append(newUser)
    return {"mensage" : f"Usuario {newUser.name} se agrego a la lista EXITOSAMENTE"}

# Actualizar la edad de un usuario basandose en el nombre de uno
@router.put("/name/{name_user}")
async def update_user_age(new_age : UserAge, name_user : str):
    for names in name_bd:
        if names.name == name_user:
            names.age = new_age.age
            return {"mensage" : f"La edad del usuario {name_user} se acabo de actualizar a {new_age.age}"}
    
    raise HTTPException(
        status.HTTP_404_NOT_FOUND,
        detail= f"El usuario {name_user} no existe"
    )


# borra un usuario de la lista 
@router.delete("/name/{name_user}")
async def delete_a_user(name_user : str):
    for user in name_bd:
        if user.name == name_user:
            delete_a_user(name_user)
            raise HTTPException(
                status.HTTP_200_OK,
                detail=f"El nombre {name_user} fue eliminado con exito de la lista"
            )
    
    raise HTTPException(
        status.HTTP_404_NOT_FOUND,
        detail=f"El nombre {name_user} no existe"
    )
    
    
def delete_a_user(user : str):
    for index, name in enumerate(name_bd):
        if user == name.name:
            del name_bd[index]