class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
