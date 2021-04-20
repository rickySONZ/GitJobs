class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :posting_id
      t.string :url
      t.string :location
      t.string :description
      t.string :company_logo
      t.string :how_to_apply

      t.timestamps
    end
  end
end
