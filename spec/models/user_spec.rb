require 'rails-helper'

describe User do
  describe '#create' do
    it 'is valid' do
      user = build(:user) 
      #user = User.new(nickname: "taro", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")と同じ意味となる
      user.valid? #バリデーションの確認
      expect(user).to be_valid
      #expectで指定された値がtoメソッドで指定した内容と一致すればテスト成功となる
    end
    
    it 'is invalid without email' do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to.include("can't be blank")
    end
  end
end

