class AddEnumsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :status, :integer
    add_column :projects, :phase, :integer
    add_column :projects, :category, :integer
  end
end
