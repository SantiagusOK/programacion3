from fastapi import APIRouter

router = APIRouter()

@router.get("/producto", status_code=404)
async def get_producto():
    return ["coso1", "coso2", "coso3", "coso4"]