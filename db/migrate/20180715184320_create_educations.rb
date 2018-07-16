class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.integer :resume_id
      t.string :institute_name
      t.string :degree
      t.datetime :start_date
      t.datetime :end_date
      t.float :gpa

      t.timestamps
    end
  end
end
