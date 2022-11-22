class Videos::Index::VideoSerializer < ActiveModel::Serializer
  attributes :name, :name_category

  def name_category
    object.category.name
  end
end