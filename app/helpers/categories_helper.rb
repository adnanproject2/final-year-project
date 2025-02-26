module CategoriesHelper
    def category_status(obj)
        obj.status == 1 ? 'Active' : 'Inactive'
    end
end
