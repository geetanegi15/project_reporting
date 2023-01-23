class AddManagerRefToProject < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :manager, foreign_key: true
  end
end
