class Contact < ActiveRecord::Base
  validates :email, presence: true
  validates :message, presence: true
  validates :name, presence: true
end
