class AddInstallsToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :installs, :integer, :default => 0
  end
end
