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
async def retrieve_all_events(session:Session=Depends(get_session)):
    statemts = select(Event)
    events = session.exec(statemts).all()
    print(f"Valor del statemns------------------------------------------- {statemts}")
    return events


@event_router.get("/{id}", response_model=Event)
async def retrieve_event(id: int, session: Session = Depends(get_session)) -> Event:
    event = session.get(Event, id)

    if event:
        return event
    
    else:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Event with supplied ID does not exist"
        )


@event_router.post("/new")
async def create_event(body: Event, session:Session=Depends(get_session)) -> dict:
    session.add(body)
    session.commit()
    session.refresh(body)
    return {
        "message": "Event created successfully"
    } 


@event_router.delete("/{id}")
async def delete_event(id: int) -> dict:
    for event in events:
        if event.id == id:
            events.remove(event)
            return {
                "message": "Event deleted successfully"
            }

    raise HTTPException(
        status_code=status.HTTP_404_NOT_FOUND,
        detail="Event with supplied ID does not exist"
    )
