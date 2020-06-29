require 'rails_helper'

RSpec.describe User, type: :model do
  # 姓、名、メール、パスワードがあれば有効な状態であること
  it "is valid with name, email, and password" do
    user = User.new(
      name: "Aaron",
      email: "aaaa@aaaa.com",
      password: "aaaa0000",
      )
      expect(user).to be_valid
  end
  
  # 名がなければ無効な状態であること
  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid? # valid?:ActiveRecordメソッドで、モデルオブジェクトのバリデーションが成功したかどうか真偽値で返す
    expect(user.errors[:name]).to include("can't be blank") #toをnot_toにすると失敗の確認もできる
  end
  
  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank") 
  end
  
  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    User.create(
      name: "joe",
      email: "test@example.com",
      password: "example1234"
    ) #テストの前にcreateでユーザーを保存
    user = User.new(
      name: "joe",
      email: "test@example.com",
      password: "example1234"
    ) #2件目のユーザーをテスト対象のオブジェクトとしてインスタンス化した。
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  
  # 重複した名前なら無効な状態であること
  it "is invalid with a duplicate name" do
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


end
