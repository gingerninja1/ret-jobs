class CreateJobCategories < ActiveRecord::Migration
  def change
    create_table :job_categories do |t|
      t.integer "job_id"
      t.integer "category_id"
    end
  end
end
