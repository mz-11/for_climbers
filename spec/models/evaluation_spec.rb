require 'rails_helper'

RSpec.describe Evaluation, type: :model do
  # before do
  #   @evaluation = FactoryBot.build(:evaluation)
  # end
  # let(:evaluation) { FactoryBot.create_list(:evaluation, 5) }
  let(:evaluation) { FactoryBot.create(:evaluation) }

  context "自己評価に関するバリデーション" do
    it "1以上5以下の整数であること" do
      # expect(@evaluation).to be_valid
      expect(evaluation).to be_valid
    end
  end
end
