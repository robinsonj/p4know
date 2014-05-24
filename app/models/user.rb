class User < ActiveRecord::Base
  has_and_belongs_to_many :things

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
