class Prototype < ApplicationRecord
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
  
  belongs_to :user
  has_one_attached :image
  has_many :comments ,dependent: :destroy
end

private

def prototype_params
  params.require(:prototype).permit(:image).merge(user_id: current_user.id)
end
