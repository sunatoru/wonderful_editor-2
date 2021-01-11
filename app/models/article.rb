class Article < ApplicationRecord
  belongs_to :user
  has_many :coment, dependent: :destroy
  has_many :article_like, dependent: :destroy
  validates :title, length: { maximum: 40 }, presence: true
end
