class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string  :first_name, null: false
      t.string  :last_name,  null: false
      t.string  :sex,        null: false
      t.datetime :birthday,  null: false

      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
