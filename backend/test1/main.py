from fastapi import FastAPI
from routers.products import products_router

app = FastAPI()

# routers
app.include_router(products_router, prefix="/products")


@app.get("/")
async def home():
    return {"message" : "hello world"}


