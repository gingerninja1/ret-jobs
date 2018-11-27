class ChangePtypeToText < ActiveRecord::Migration
  def change
    change_column :profiles, :ptype, :text
  end
end
