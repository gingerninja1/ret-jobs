class RemovePtypeFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :ptype
  end
end
