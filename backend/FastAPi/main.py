from fastapi import FastAPI
from Routers import productos, users
from fastapi.staticfiles import StaticFiles



app = FastAPI()

# Routers

app.include_router(productos.router)
app.include_router(users.router)
app.mount("/static", StaticFiles(directory="staticado"), name="statico")



@app.get('/')
async def root():
    return "hola mundo"


@app.get('/url')
async def root2():
    return {" url del coso": "este url esta chido"}