require 'rails_helper'

describe Cafeteria do
  describe '#create' do
    # 1
    it "すべての項目を入力すれば登録できること" do
      cafeteria = build(:cafeteria)
      expect(cafeteria).to be_valid
    end
    # 2
    it "nameがない場合は登録できないこと" do
      cafeteria = build(:cafeteria, name: "")
      cafeteria.valid?
      expect(cafeteria.errors[:name]).to include("を入力してください")
    end
    # 3
    it "detailがない場合は登録できないこと" do
      cafeteria = build(:cafeteria, detail: "")
      cafeteria.valid?
      expect(cafeteria.errors[:detail]).to include("を入力してください")
    end
    # 4
    it "addresがない場合は登録できないこと" do
      cafeteria = build(:cafeteria, addres: "")
      cafeteria.valid?
      expect(cafeteria.errors[:addres]).to include("を入力してください")
    end
    # 5
    it "nameの文字数が41文字以上だと登録不可" do
      cafeteria = build(:cafeteria, name: "a" * 41)
      cafeteria.valid?
      expect(cafeteria.errors[:name]).to include("は40文字以内で入力してください")
    end
    # 6
    it "nameの文字数が40字以内だと登録可能" do
      cafeteria = build(:cafeteria, name: "a" * 40)
      expect(cafeteria).to be_valid
    end
    # 7
    it "detailの文字が1001文字以上だと登録不可" do
      cafeteria = build(:cafeteria, detail: "a" * 1001)
      cafeteria.valid?
      expect(cafeteria.errors[:detail]).to include("は1000文字以内で入力してください")
    end
    # 8
    it "detailの文字数が1000字以内だと登録可能" do
      cafeteria = build(:cafeteria, detail: "a" * 1000)
      expect(cafeteria).to be_valid
    end
    # 9
    it "imageがなくても保存できる" do
      cafeteria = build(:cafeteria, image: "")
      expect(cafeteria).to be_valid
    end
  end
end