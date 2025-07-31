from datetime import datetime
from pydantic import BaseModel

class CategoryBase(BaseModel):
    name: str
    slug: str
    description: str
    icon_url: str
    created_at: datetime