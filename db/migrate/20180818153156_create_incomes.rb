class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.string :category
      t.string :value
      t.string :description

      t.timestamps
    end
  end
end
