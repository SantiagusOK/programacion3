from fastapi import APIRouter, HTTPException, status
from models.producto import ProductoBase, Producto

producto_router = APIRouter(tags=["Producto"])

# {
#   "id" : 4,
#   "nombre" : "Danonino",
#   "categoria" : "Yogur",
#   "descripcion" : "Un vaso con yogur",
#   "precio" : 99.99,
#   "stock" : 100,
#   "stock_minimo" : 20,
#   "stock_maximo" : 150,
#   "activo" : true
# }
lista_producto = [
    Producto(1,"Coca-Cola", "Bebida", "Una coca con cola", 39.99, 10,6,10, True),
    Producto(2,"Pepsi", "Bebida", "Copia de coca cola", 29.99, 10,6,10, True),
    Producto(3,"Manaos", "Bebida", "gaseosa barata", 19.99, 10,6,10, False)
]


@producto_router.get("/{id}/stock")
async def get_a_stock(id : int):
    for producto in lista_producto:
        if producto.id == id:
            bajo_stock_minimo = True if producto.stock < producto.stock_minimo else False
            return {
                "Stock" : producto.stock,
                "bajo_stock_minimo" : bajo_stock_minimo,
                "activo" : producto.activo
            }

    raise HTTPException(
        status.HTTP_404_NOT_FOUND,
        detail=f"No se encontró el producto con el id {id}"
    )


@producto_router.get("/")
async def get_all_products():
    return lista_producto


@producto_router.get("/{id}")
async def get_a_product(id : int):
    for producto in lista_producto:
        if producto.id == id:
            return producto
        
    raise HTTPException(
        status.HTTP_404_NOT_FOUND,
        detail=f"No se encontró el producto con el id {id}"
    )
    
    

@producto_router.post("/crear",status_code=200)
async def create_new_product(newProduct : ProductoBase):
    for producto in lista_producto:
        if producto.nombre == newProduct.nombre:
            raise HTTPException(
                status.HTTP_302_FOUND,
                detail=f"El producto: {newProduct.nombre} ya existe")
    
    
    new_new_product = Producto(**newProduct.model_dump())
    lista_producto.append(new_new_product)
    return {"message" : f"Producto creado {new_new_product.nombre} con exito"}


@producto_router.put("/{id}")
async def update_a_product(id : int, product_updated : ProductoBase):
    for index, producto in enumerate(lista_producto):
        if producto.id == id:
            product_updateado = Producto(**product_updated.model_dump())
            lista_producto[index] = product_updateado

        return {"message" : f"El producto {product_updated.nombre} se actualizo"}
        
    raise HTTPException(
        status.HTTP_404_NOT_FOUND,
        detail=f"No se encontró el producto con el id {id}"
    )
    
    
@producto_router.put("/{id}/desactivar")
async def desactivate_a_product(id : int):
    for producto in lista_producto:
        if producto.id == id:
            if not producto.activo:
                return {"message" : f"El producto {producto.nombre} ya estaba desactivado"}
            else:
                producto.activo = False
                return {"message" : f"El producto {producto.nombre} se desactivo"}
    raise HTTPException(
        status.HTTP_404_NOT_FOUND,
        detail=f"No se encontró el producto con el id {id}"
    )