class CreateEmployees < ActiveRecord::Migration[8.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :emp_code
      t.string :job_title
      t.string :department
      t.string :country
      t.string :branch_location, limit: 200
      t.decimal :salary, precision: 10, scale: 2

      t.timestamps
    end
  end
end
