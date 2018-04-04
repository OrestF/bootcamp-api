class UserSerializer < ActiveModel::Serializer
  attributes User.json_fields
end