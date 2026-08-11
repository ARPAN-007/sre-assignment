from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(
    title="SRE Assessment API",
    version="1.0.0"
)


class WorkItem(BaseModel):
    name: str
    description: str


processed_items = []


@app.get("/api/work")
def get_work():
    return {
        "items": processed_items,
        "count": len(processed_items)
    }


@app.post("/api/work")
def create_work(work: WorkItem):
    item = {
        "name": work.name,
        "description": work.description,
        "status": "queued"
    }

    processed_items.append(item)

    return {
        "message": "Work item accepted",
        "item": item
    }


@app.get("/health/live")
def liveness():
    return {"status": "alive"}


@app.get("/health/ready")
def readiness():
    return {"status": "ready"}