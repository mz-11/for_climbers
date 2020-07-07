require 'rails_helper'

RSpec.describe User, type: :model do
  context "基本的なフォームのバリデーション" do
    it "名前、メール、パスワードがあれば有効な状態であること" do
      # user = User.new(
      #   name: "Aaron",
      #   email: "aaaa@aaaa.com",
      #   password: "aaaa0000",
      # )
      # 以下はFactoryBoyを使用
      user = build(:user)
        expect(user).to be_valid
    end

    it "名前がなければ無効な状態であること" do
      user = User.new(name: nil)
      user.valid? # valid?:ActiveRecordメソッドで、モデルオブジェクトのバリデーションが成功したかどうか真偽値で返す
      expect(user.errors[:name]).to include("can't be blank") # toをnot_toにすると失敗の確認もできる
    end

    it "メールアドレスがなければ無効な状態であること" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "重複したメールアドレスなら無効な状態であること" do
      User.create(
        name: "joe",
        email: "test@example.com",
        password: "example1234"
      ) # テストの前にcreateでユーザーを保存
      user = User.new(
        name: "joe",
        email: "test@example.com",
        password: "example1234"
      ) # 2件目のユーザーをテスト対象のオブジェクトとしてインスタンス化した。
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end

    it "重複した名前なら無効な状態であること" do
      User.create(
        name: "tarou",
        email: "test@example.com",
        password: "example1234"
      )
      user = User.new(
        name: "tarou",
        email: "test@example.com",
        password: "example1234"
      )
      user.valid?
      expect(user.errors[:name]).to include("has already been taken")
    end

    it "名前の文字数が15文字以内であること" do
      user = User.new(name: "a" * 16)
      # expect(user.errors[:name]).to include("is too long (maximum is 15 characters)")
      expect(user).to be_invalid
    end

    # 正規表現のテスト
    it "メールアドレスの正規表現と一致すること" do
      user = User.new(email: "test@example.com")
      expect(user.email).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
    end

    it "パスワードの正規表現と一致すること" do
      user = User.new(password: "example1234")
      expect(user.password).to match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i)
    end
  end
end
