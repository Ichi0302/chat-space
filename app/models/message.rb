class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :text, presence: true

  def created_time
    created_at.strftime('%Y年%m月%d日 %H時%M分')
  end
end
