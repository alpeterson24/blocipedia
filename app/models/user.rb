class User < ApplicationRecord
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
   after_initialize :give_standard_role
   has_many :wikis
   has_many :collaborators
   has_many :collaborate_wikis, through: :collaborators, source: :wiki

   validates :role, presence: true

   enum role: [:standard, :premium, :admin]
   private

   def give_standard_role
    self.role ||= :standard
   end
end
