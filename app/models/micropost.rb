class Micropost < ActiveRecord::Base
  #attr_accessor :content, :user_id
  belongs_to :user
  default_scope -> { order('created_at desc') }
  validates :user_id, presence: true
end
