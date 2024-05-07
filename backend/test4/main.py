from fastapi import FastAPI

app = FastAPI()

#endpoint pedido
@app.get("/")
async def hola():
    return "hola"