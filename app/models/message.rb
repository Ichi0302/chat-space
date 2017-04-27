class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
<<<<<<< HEAD
  validates :text_or_image, presence: true

  mount_uploader :image, ImageUploader

  private
  def text_or_image
    text.presence || image.presence
  end

=======
  validates :text, presence: true

  def created_time
    created_at.strftime('%Y年%m月%d日 %H時%M分')
  end
>>>>>>> master
end
