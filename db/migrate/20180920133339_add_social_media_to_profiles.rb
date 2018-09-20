class AddSocialMediaToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :social_fb, :string
    add_column :profiles, :social_in, :string
  end
end
