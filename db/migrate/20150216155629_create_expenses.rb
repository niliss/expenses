class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :category, index: true
      t.date :fecha
      t.string :concept
      t.float :amount

      t.timestamps null: false
    end
    add_foreign_key :expenses, :categories
  end
end
