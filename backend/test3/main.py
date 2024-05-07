from fastapi import FastAPI
from routers.User import user_router
app = FastAPI()

#routers
app.include_router(user_router, prefix="/user")

@app.get("/")
async def home():
    return {"message" : "Hello World"}