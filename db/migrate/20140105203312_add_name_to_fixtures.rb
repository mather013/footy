class AddNameToFixtures < ActiveRecord::Migration[5.0]
  def change
    add_column :fixtures, :name, :string
  end
end
