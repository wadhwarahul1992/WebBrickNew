module CategoriesHelper

  def category_for_collection
    categories = []
    x = []
    tmp_array = []
    other_object = Category.where(name: 'Others').last
    tmp_array = Category.where.not(name: ['Others']).collect{ |a| [a.name, a.id] }
    if other_object.present?
      x = [[other_object.name, other_object.id]]
    end
    categories = tmp_array + x
    categories
  end
end