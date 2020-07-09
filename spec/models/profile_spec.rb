require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile)
  end
  
  context "プロフィールフォームに関するバリデーション" do
    it "user_idがなければ無効な状態であること" do
      @profile = FactoryBot.build(:profile, user_id: nil)
      expect(@profile).to be_invalid
    end
  end
end
