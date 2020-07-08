require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    # @post = FactoryBot.create(:post, user: user) association :user設定したので以下のように書くだけで良い
    @post = FactoryBot.build(:post)
  end

  context "基本的な投稿フォームのバリデーション" do
    it "外部キー(user_id)、投稿の画像、ジム名、グレード、カテゴリーがあれば有効であること" do
      expect(@post).to be_valid
    end
  end
end
