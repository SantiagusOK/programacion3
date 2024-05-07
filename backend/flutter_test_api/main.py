from fastapi import FastAPI
from users import users_router
app = FastAPI()
app.include_router(users_router, prefix="/user")

@app.get("/")
async def home():
    return {"message" : "hello world"}