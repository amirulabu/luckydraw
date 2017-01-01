class CreateWinners < ActiveRecord::Migration[5.0]
  def change
    create_table :winners do |t|
      t.string :name
      t.string :petid

      t.timestamps
    end
  end
end
