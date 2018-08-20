class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string   "title"
      t.text     "description"
      t.integer  "user_id"
      t.text     "price"
      t.timestamps
    end
  end
end
