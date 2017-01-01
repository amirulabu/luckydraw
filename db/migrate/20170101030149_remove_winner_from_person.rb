class RemoveWinnerFromPerson < ActiveRecord::Migration[5.0]
  def change
  	remove_column :people, :winner
  end
end
