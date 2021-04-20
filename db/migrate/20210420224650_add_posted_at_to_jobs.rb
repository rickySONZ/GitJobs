class AddPostedAtToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :posted_at, :string
  end
end
