class AddStatusToFixtures < ActiveRecord::Migration
  def change
    add_column :fixtures, :status, :string, :default => Fixture::Status::DEFINED
  end
end
