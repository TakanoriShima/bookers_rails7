class Book < ApplicationRecord
  # ---- 以下を追加してください ---- #
  validates :title, presence: true
  validates :body, presence: true
end
