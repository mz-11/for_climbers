require 'rails_helper'

RSpec.describe Evaluation, type: :model do
  # before do
  #   @evaluation = FactoryBot.build(:evaluation)
  # end
  let(:evaluation) { FactoryBot.create(:evaluation) }
  let(:user) { build(:user) }
  
  context "自己評価に関するバリデーション" do
    it "1以上5以下の整数であること" do
      # expect(@evaluation).to be_valid
      expect(evaluation).to be_valid
    end
  end
  
  describe "search" do
    it "渡した引数に該当するレコードを検索する" do
      expect(evaluation.search(evaluation.user_id, evaluation.category)).to be_valid
    end
  end
  
end
