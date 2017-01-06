class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :collaborate_users, through: :collaborators, source: :user

  default_scope {order('created_at DESC')}

end
