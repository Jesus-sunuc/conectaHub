from src.services.database.helper import run_sql
from src.models.categories import CategoryBase

class CategoryRepository:
    def get_all_categories(self):
        query = "select * from business_categories"
        return run_sql(query, output_class=CategoryBase)
