class CreateExperinces < ActiveRecord::Migration[5.2]
  def change
    create_table :experinces do |t|
      t.integer :resume_id
      t.string :company_name
      t.string :designation
      t.text :job_description
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :current

      t.timestamps
    end
  end
end
