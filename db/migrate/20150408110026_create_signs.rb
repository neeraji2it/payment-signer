class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.references :payment, index: true
      t.text :signature

      t.timestamps
    end
  end
end
