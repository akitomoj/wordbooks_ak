class CreateWordUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :word_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :word, null: false, foreign_key: true
      t.timestamps
    end
  end
end
