require 'rails_helper'

describe User do
  describe '#create' do
    # 1
    it "すべての項目を入力すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2
    it " usernameがない場合は登録できないこと" do
      user = build(:user, username: nil)
      user.valid?
      expect(user.errors[:username]).to include("を入力してください")
    end

    # 3
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # 4
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    # 5
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    # 6
    it " passwordが6文字以上であれば登録できること " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end

    # 7
    it " passwordが5文字以下であれば登録できないこと " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    # 8
    it "emailに＠がない場合保存できないこと" do
      user = build(:user, email: '12345678')
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    # 9
    it 'emailの＠以降のドメイン記述がない場合保存できないこと' do
      user = build(:user, email: '1234567@')
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    # 10
    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # 11
    it "nicknameが7文字以下では登録できること " do
      user = build(:user, username: "aaaaaaa")
      expect(user).to be_valid
    end

    # 12
    it "nicknameが8文字以上では登録できないこと " do
      user = build(:user, username: "aaaaaaaa")
      user.valid?
      expect(user.errors[:username]).to include("は7文字以内で入力してください")
    end
  end
end