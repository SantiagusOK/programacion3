from sqlmodel import SQLModel, Session, create_engine
from models.events import Event, EventBody


database_file = "mi_dataBase"
databaFile_location = f"sqlite:///{database_file}"
connect_args = {"check_same_thread" : False}
engine_url = create_engine(databaFile_location,echo=True, connect_args=connect_args)


def conn():
    SQLModel.metadata.create_all(engine_url)
    
def get_session():
    with Session(engine_url) as session:
        yield session