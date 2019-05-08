class First < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |w|
          w.text :word
          w.text :translate
          w.integer :rating

          w.timestamps
        end

  end
end
