from fastapi import APIRouter

router = APIRouter(
    prefix="/producto",
    responses={400 : {"message" : "NO encontrado"}}, 
    tags=["producto"])

@router.get("/")
async def get_producto():
    return ["coso1", "coso2", "coso3", "coso4"]