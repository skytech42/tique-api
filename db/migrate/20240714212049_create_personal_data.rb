class CreatePersonalData < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_data do |t|
      t.string :email
      t.string :name
      t.string :last_name
      t.integer :identifier_type
      t.string :identifier_number
      t.timestamps
    end
  end
end
