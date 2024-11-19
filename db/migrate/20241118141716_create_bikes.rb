class CreateBikes < ActiveRecord::Migration[7.1]
  def change
    create_table :bikes do |t|
      t.string :type
      t.string :size
      t.string :condition
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.decimal :cost_per_day

      t.timestamps
    end
  end
end
