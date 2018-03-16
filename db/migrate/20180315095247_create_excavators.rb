class CreateExcavators < ActiveRecord::Migration[5.1]
  def change
    create_table :excavators do |t|
      t.string  :company_name
      t.string  :address
      t.string  :city
      t.string  :state
      t.string  :zip
      t.string  :type
      t.integer :ticket_id
      t.boolean :crew_on_site
      t.timestamps
    end
  end
end
