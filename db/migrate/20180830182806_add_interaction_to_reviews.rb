class AddInteractionToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :interaction, :string
  end
end
