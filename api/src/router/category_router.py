from fastapi import APIRouter
from src.repository.category_repository import CategoryRepository

router = APIRouter(
    prefix="/categories",
    tags=["categories"],
    responses={404: {"description": "Not found"}}
)

repo = CategoryRepository()

@router.get("/all")
def get_all_categories():
    return repo.get_all_categories()