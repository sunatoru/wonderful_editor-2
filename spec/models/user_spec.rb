require "rails_helper"

RSpec.describe User, type: :model do
  describe "成功" do
    context "入力情報が揃っているとき" do
      it "ユーザーが作成される" do
        user = build(:user)
        expect(user).to be_valid
      end
    end
  end

  describe "異常" do
    context "nameしかない時" do
      it "ユーザーは作成できない" do
        user = build(:user, email: nil, password: nil)
        expect(user).not_to be_valid
      end
    end

    context "emailがない時" do
      it "ユーザーは作成できない" do
        user = build(:user, email: nil)
        expect(user).not_to be_valid
      end
    end

    context "passwordがない時" do
      it "ユーザーは作成できない" do
        user = build(:user, password: nil)
        expect(user).not_to be_valid
      end
    end
  end
end
