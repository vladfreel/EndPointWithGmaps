class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string    :RequestNumber
      t.integer   :SequenceNumber
      t.string    :RequestType
      t.string    :PrimaryServiceAreaCode
      t.string    :AdditionalServiceAreaCodes
      t.text      :DigsiteInfo
      t.datetime  :ResponseDueDateTime
      t.timestamps
    end
  end
end
