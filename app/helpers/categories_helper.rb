module CategoriesHelper
    def category_status(obj)
        obj.status == 1 ? 'Active' : 'Inactive'
    end

    def categories 
        @account.categories.where(status: 1).pluck([:name, :id])
    end

    def category_created_day obj 
        obj.created_at.strftime('%d-%m-%Y')
    end
end
