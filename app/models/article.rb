class Article < ApplicationRecord
  belongs_to :user
  has_many :coment, dependent: :destroy
  has_many :article_like, dependent: :destroy
end
