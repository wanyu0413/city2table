class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :category
      t.integer :price
      t.string :name

      t.timestamps
    end
  end
end
