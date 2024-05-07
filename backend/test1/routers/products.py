from fastapi import APIRouter, HTTPException, status
from models.products import Products, PedirProducts
from typing import List
products_router = APIRouter(tags=["Products"])

product_list = [
    Products(1, "Mayonesa", 300),
    Products(2, "Agua", 200)
]


@products_router.get("/all")
async def get_all_products():
    return product_list

@products_router.get("/{name_product}", status_code=200)
async def get_one_product(name_product : str):
    for product in product_list:
        if product.name.lower() == name_product.lower():
            return product

    raise HTTPException(
        status.HTTP_404_NOT_FOUND,
        detail=f"El producto {name_product} no esta en la lista"
    )

@products_router.post("/new",status_code=201)
async def create_new_products(new_product : PedirProducts):
    if not product_exist(new_product):
        product_list.append(new_product)
        return {"message" : f"El producto {new_product.name} se agrego correctamente"}
    else:
        raise HTTPException(
            status.HTTP_302_FOUND,
            detail="El producto ya esta en la lista")

@products_router.put("/update/{name_product}", status_code=200)
async def update_a_product(name_product : str, product_update : PedirProducts):
    for index, product in enumerate(product_list):
        if product.name.lower() == name_product.lower():
            product_list[index] = product_update
            return {"message" : f"El producto {product.name} se actualizo correctamente"}
    
    raise HTTPException(
        status.HTTP_404_NOT_FOUND,
        detail=f"El producto {name_product} no esta en la lista"
    )
    
@products_router.delete("/delete/{name_product}", status_code=200)
async def delete_a_product(name_product : str):
    for index, product in enumerate(product_list):
        if product.name.lower() == name_product.lower():
            product_list.pop(index)
            return {"message" : f"El producto {product.name} se elimino correctamente"}

    raise HTTPException(
        status.HTTP_404_NOT_FOUND,
        detail=f"El producto {name_product} no esta en la lista"
    )
def product_exist(new_product : PedirProducts) -> bool:
    for product in product_list:
        if product.name == new_product.name:
            return True
    return False