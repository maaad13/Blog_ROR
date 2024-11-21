class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :tittle, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  VALID_STATUSES = [ "public", "private", "archived" ]

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == "archived"
  end
end


