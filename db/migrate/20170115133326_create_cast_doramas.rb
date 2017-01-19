class CreateCastDoramas < ActiveRecord::Migration[5.0]
  def change
    create_table :cast_doramas do |t|
      t.belongs_to :dorama
      t.belongs_to :cast

      t.timestamps
    end
  end
end
