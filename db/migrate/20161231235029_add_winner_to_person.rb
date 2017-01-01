class AddWinnerToPerson < ActiveRecord::Migration[5.0]
  def change
  	add_column :people, :winner, :integer, :default => 0
  end
end
