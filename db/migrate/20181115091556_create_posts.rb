class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :body, null: false

      t.references :user, index: true, foreign_key: true
    end
  end
end
