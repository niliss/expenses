class Expense < ActiveRecord::Base
  belongs_to :category
  validates :amount, presence: true

end
