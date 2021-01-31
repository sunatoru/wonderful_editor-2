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
        expect(res[0].keys).to eq ["id", "title", "body", "updated_at", "user"]
      end
    end
  end

  describe "GET /articles/:id" do
    subject { get(api_v1_article_path(article_id)) }

    context "指定したidが存在する時" do
      let(:article) { create(:article) }
      let(:article_id) { article.id }

      it "そのユーザーは記事一覧の値を取得できる" do
        subject
        aggregate_failures "最後まで通過" do
          res = JSON.parse(response.body)

          expect(response).to have_http_status(:ok)
          expect(res["id"]).to eq article.id
          expect(res["title"]).to eq article.title
          expect(res["body"]).to eq article.body
          expect(res["updated_at"]).to be_present
          expect(res["user"]["id"]).to eq article.user.id
          expect(res["user"].keys).to eq ["id", "name", "email"]
        end
      end
    end

    context "指定したidが存在しない" do
      let(:article_id) { 100000 }

      it "記事はない" do
        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
