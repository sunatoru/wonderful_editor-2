require "rails_helper"

RSpec.describe Coment, type: :model do
  describe "異常" do
    context "コメントが書かれていない場合" do
      it "errorが出る" do
        coment = build(:coment, body: nil)
        expect(coment).not_to be_valid
      end
    end
  end
end
