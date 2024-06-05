from typing import List

from fastapi import APIRouter, HTTPException, status, Depends
from sqlmodel import Session, select
from models.events import Event, EventBody
from database.connect import get_session

event_router = APIRouter(
    tags=["Events"]
)

{
  "title" : "Tarea",
  "image" : "image/coso.jpg",
  "description" : "una tarea que hacer",
  "tags" : [ "tarea", "aburrido"],
  "location" : "mi casa"
}

events = []


@event_router.get("/")
async def retrieve_all_events(session=Depends(get_session)):
    statemts = select(Event)
    events = session.exec(statemts).all()
    print(f"Valor del statemns------------------------------------------- {statemts}")
    return events


@event_router.get("/getEvent/{id}")
async def get_a_event(id : int, session=Depends(get_session)):
    statements = select(Event).where(Event.id == id)
    event = session.exec(statements).all()
    if event:
        return event
    
    else:
        raise HTTPException(
            status.HTTP_404_NOT_FOUND,
            detail=f"No es encontro el evento con el id {id}"
        )
        
        
@event_router.put("/update/{id}")
async def update_a_event(id:int, session=Depends(get_session)):
    statements = select(Event).where(Event.id == id)
    
    aEvent = session.exec(statements).all()
    
    eventUpdate : Event = aEvent[0]
    
    eventUpdate.title = "Tortita"
    
    session.add(eventUpdate)
    session.commit()
    session.refresh(eventUpdate)
    
    
    raise HTTPException(
        status.HTTP_200_OK,
        detail="El evento se actualizo"
    )


@event_router.get("/{id}", response_model=Event)
async def retrieve_event(id: int, session= Depends(get_session)) -> Event:
    event = session.get(Event, id)

    if event:
        return event
    
    else:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Event with supplied ID does not exist"
        )


@event_router.post("/new")
async def create_event(body: Event, session=Depends(get_session)) -> dict:
    session.add(body)
    session.commit()
    session.refresh(body)
    return {
        "message": "Event created successfully"
    } 


@event_router.delete("/delete/{id}")
async def delete_event(id: int, session=Depends(get_session)) -> dict:
    
    event = session.get(Event, id)
    
    if event:
        session.delete(event)
        session.commit()
        return {
            "message": "Event deleted successfully"
        }

    raise HTTPException(
        status_code=status.HTTP_404_NOT_FOUND,
        detail="Event with supplied ID does not exist"
    )
