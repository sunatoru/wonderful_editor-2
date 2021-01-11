require "rails_helper"

RSpec.describe Article, type: :model do
  describe "成功" do
    context "titleとbodyが書かれている時" do
      it "articleが投稿できる" do
        article = build(:article)
        expect(article).to be_valid
      end
    end
  end
end
