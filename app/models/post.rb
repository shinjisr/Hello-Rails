class Post < ApplicationRecord
  belongs_to :user
  # To validate the title column has value. 標題欄為必填。
  # Use method "errors" to check what error occurred.
  validates :title, presence: true
end
