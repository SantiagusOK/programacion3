from fastapi import FastAPI

app = FastAPI()

@app.get('/')
async def root():
    return "hola mundo"


@app.get('/url')

async def root2():
    return {" url del coso": "este url esta chido"}