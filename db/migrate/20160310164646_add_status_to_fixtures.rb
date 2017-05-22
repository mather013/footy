class AddStatusToFixtures < ActiveRecord::Migration[5.0]
  def change
    add_column :fixtures, :status, :string, :default => Fixture::Status::DEFINED
  end
end
