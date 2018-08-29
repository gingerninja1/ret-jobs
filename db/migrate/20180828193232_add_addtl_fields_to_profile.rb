class AddAddtlFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :bio, :text
    add_column :profiles, :skills, :text
    add_column :profiles, :pricing, :text
  end
end
