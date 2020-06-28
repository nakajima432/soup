require 'rails_helper'

describe Comment do
  describe '#create' do
    # 1
    context 'can save' do
      it 'コメントの登録ができる' do
        expect(build(:comment)).to be_valid
      end
    end
    context 'can not save' do
      # 2
      it 'textが空だと登録できないこと' do
        comment = build(:comment, text: nil)
        comment.valid?
        expect(comment.errors[:text]).to include('を入力してください')
      end
      # 3
      it 'cafeteria_idが空だと登録できないこと' do
        comment = build(:comment, cafeteria_id: nil)
        comment.valid?
        expect(comment.errors[:cafeteria]).to include('を入力してください')
      end
      # 4
      it 'user_idが空だと登録できないこと' do
        comment = build(:comment, user_id: nil)
        comment.valid?
        expect(comment.errors[:user]).to include('を入力してください')
      end
    end
  end
end