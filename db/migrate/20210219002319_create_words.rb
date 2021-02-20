class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :eng_word, null: false
      t.string :meaning,  null: false
      t.timestamps
    end
  end
end
