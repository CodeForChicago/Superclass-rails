module V1
  class SessionSerializer < ActiveModel::Serializer

    attributes :email, :username, :role, :token_type, :user_id, :access_token

    def user_id
      object_id
    end

    def token_type
      'Bearer'
    end

  end
end
