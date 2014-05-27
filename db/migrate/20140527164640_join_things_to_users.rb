class JoinThingsToUsers < ActiveRecord::Migration
  def change
    create_join_table :users, :things
  end
end
