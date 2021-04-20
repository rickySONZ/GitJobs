class CreateUserJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :user_jobs do |t|
      t.integer :user_id
      t.integer :job_id
      t.boolean :applied, :default => false
      t.boolean :interested, :default => false

      t.timestamps
    end
  end
end
