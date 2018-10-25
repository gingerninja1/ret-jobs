class AddProfileType < ActiveRecord::Migration
  def change
    add_column :profiles, :ptype, :string
  end
end
