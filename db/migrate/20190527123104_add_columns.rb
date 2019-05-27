class AddColumns < ActiveRecord::Migration[5.2]
  def change

    add_column :words, :phraze, :text
    add_column :words, :level, :text

  end
end
