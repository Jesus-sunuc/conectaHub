from src.services.database.helper import run_sql
from src.models.categories import CategoryBase

class CategoryRepository:
    def get_all_categories(self):
        sql = "select * from business_categories"
        return run_sql(sql, output_class=CategoryBase)
