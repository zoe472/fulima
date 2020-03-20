require 'rails_helper'
describe User do
  describe '#create' do
    it "全てのカラムに入力があると登録できる" do
     user = build(:user)
     expect(user).to be_valid
    end

    it "nicknameカラムが空だと登録できない" do
     user = build(:user, nickname: "")
     user.valid?
     expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailカラムが空だと登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
     end

     it "passwordカラムが空だと登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
     end

     it "familynameカラムが空だと登録できない" do
      user = build(:user, familyname: "")
      user.valid?
      expect(user.errors[:familyname]).to include("を入力してください")
     end

     it "nameカラムが空だと登録できない" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
     end

     it "kana_familynameカラムが空だと登録できない" do
      user = build(:user, kana_familyname: "")
      user.valid?
      expect(user.errors[:kana_familyname]).to include("を入力してください")
     end

     it "kana_nameカラムが空だと登録できない" do
      user = build(:user, kana_name: "")
      user.valid?
      expect(user.errors[:kana_name]).to include("を入力してください")
     end

     it "birthdayカラムが空だと登録できない" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
     end

     it "同じメールアドレスを登録できない" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
     end

    it "emailカラムに＠がないと登録ができない" do
      user = build(:user, email: "kkkgamil.com")
      user.valid?
      expect(user.errors.full_messages).to include("メールアドレスは不正な値です")
    end

    it "passwordカラムとpassword_confirmationカラムが違う値だと登録ができない" do
      user = build(:user, password_confirmation: "666666")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "passwordカラムに6文字以下だと登録ができない" do
      user = build(:user, password: "666666")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "passwordカラムが7文字以上だと登録ができる" do
      user = build(:user, password: "7777777", password_confirmation: "7777777")
      expect(user).to be_valid
    end

    it "familynameカラムが半角文字だと登録ができない" do
      user = build(:user, familyname: "test")
      user.valid?
      expect(user.errors[:familyname]).to include("は不正な値です")
    end

    it "nameカラムが半角文字だと登録ができない" do
      user = build(:user, name: "test")
      user.valid?
      expect(user.errors[:name]).to include("は不正な値です")
    end

    it "kana_familynameカラムが半角文字だと登録ができない" do
      user = build(:user, kana_familyname: "test")
      user.valid?
      expect(user.errors[:kana_familyname]).to include("は不正な値です")
    end

    it "kana_nameカラムが半角文字だと登録ができない" do
      user = build(:user, kana_name: "test")
      user.valid?
      expect(user.errors[:kana_name]).to include("は不正な値です")
    end
  end
end