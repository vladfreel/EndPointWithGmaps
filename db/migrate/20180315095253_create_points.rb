class CreatePoints < ActiveRecord::Migration[5.1]
  def change
    create_table :points do |t|
      t.float    :latitude
      t.float    :longitude
      t.integer   :ticket_id
      t.timestamps
    end
  end
end
