class Ticket < ActiveRecord::Base

  belongs_to :user

  validates :title, :description, presence: true

end
