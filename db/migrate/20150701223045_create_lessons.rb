class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :link
      t.string :creator
      t.text :summary

      t.timestamps null: false
    end
  end
end
