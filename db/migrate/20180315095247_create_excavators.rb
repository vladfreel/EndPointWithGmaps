class CreateExcavators < ActiveRecord::Migration[5.1]
  def change
    create_table :excavators do |t|
      t.string  :CompanyName
      t.string  :Address
      t.string  :City
      t.string  :State
      t.string  :Zip
      t.string  :Type
      t.integer :ticket_id
      t.boolean :CrewOnsite
      t.timestamps
    end
  end
end
