from fastapi import APIRouter, HTTPException, status
from pydantic import BaseModel

router = APIRouter()


class User(BaseModel):
    id: int
    name: str
    age: int


users_bd = [
    User(id=1, name='Santi', age=22),
    User(id=2, name='Agus', age=23),
    User(id=3, name='Santiago', age=24)
]


@router.get('/user/{id}')
async def get_user(id: int):
    return search_user(id)


@router.get('/user/')
async def get_all_users():
    return users_bd




@router.put("/user/")
async def update_user(user:User):
    for index ,users in enumerate(users_bd):
        if user.id == users.id:
            users_bd[index] = user
            return {"bien": f"Se actualizo el usuario"}
         




@router.post("/newUsers/", status_code=200)
async def new_user(newUser: User):
    for user in users_bd:
        if newUser.name == user.name:
            raise HTTPException(
                status.HTTP_404_NOT_FOUND,
                detail="Ese usuario ya existe")
    
    users_bd.append(newUser)
    
    return "Usuario añadido con exito"

@router.delete("/user/{id}")
async def delete_user(id:int):
    if search_user(id):
        del users_bd[id-1]
        raise HTTPException(
            status.HTTP_200_OK,
            detail="Se elimino un usuario")
    else:
        raise HTTPException(
            status.HTTP_404_NOT_FOUND,
            detail=f"no se encontro un usuario con el id: {id}"
        )
    
    



def search_user(id: int):
    for user in users_bd:
        if user.id == id:
            return user
    raise HTTPException(
        status.HTTP_404_NOT_FOUND,
        detail=f"NO se encontro el usuario con el id: {id}")
