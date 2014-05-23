class Thing < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.from_string(thing_names)
    things = []

    thing_names.strip.gsub(/ +/, '').split(/,/).each do |thing_name|
      things.push(find_or_create_by(name: thing_name)) unless thing_name.blank?
    end

    things
  end
end
