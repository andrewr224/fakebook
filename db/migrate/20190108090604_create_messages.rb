class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user,     index: true, foreign_key: true
      t.references :dialogue, index: true, foreign_key: true

      t.text    :text, null: false
      t.boolean :read, null: false, default: false

      t.timestamps
    end
  end
end
