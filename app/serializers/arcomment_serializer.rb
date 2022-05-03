class ArcommentSerializer < ActiveModel::Serializer
  attributes :comment_content

  belongs_to :article
end
