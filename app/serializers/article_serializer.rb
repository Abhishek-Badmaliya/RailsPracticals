class ArticleSerializer < ActiveModel::Serializer
  #serialize the attributes
  attributes :title, :body
end
