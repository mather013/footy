class AddNameToFixtures < ActiveRecord::Migration
  def change
    add_column :fixtures, :name, :string
  end
end
