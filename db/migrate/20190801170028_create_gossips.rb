class CreateGossips < ActiveRecord::Migration[5.2]
  attr_accessor :title
  def change
    create_table :gossips do |t|
      t.string :title
      t.text :content
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
