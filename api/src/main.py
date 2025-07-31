from dotenv import load_dotenv
from src.router import category_router

load_dotenv()

import logging
from fastapi import FastAPI, APIRouter


app = FastAPI()


logging.getLogger("uvicorn.access").addFilter(lambda _: False)


router = APIRouter(prefix="/api")


@router.get("/health")
def health_check():
    return True

router.include_router(category_router.router)

app.include_router(router)