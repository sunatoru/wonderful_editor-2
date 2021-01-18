require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  describe "GET /articles" do
    subject { get(api_v1_articles_path) }

    let!(:article1) { create(:article, updated_at: 1.day.ago) }
    let!(:article2) { create(:article, updated_at: 2.day.ago) }
    let!(:article3) { create(:article) }
    it "記事一覧が取得できる" do
      subject
      aggregate_failures "最後まで通過" do
        res = JSON.parse(response.body)
        expect(response).to have_http_status(:ok)
        expect(res.length).to eq 3
        expect(res.map {|d| d["id"] }).to eq [article3.id, article1.id, article2.id]
        expect(res[0]["user"].keys).to eq ["id", "name", "email"]
        expect(res[0].keys).to eq ["id", "title", "updated_at", "user"]
      end
    end
  end
end
