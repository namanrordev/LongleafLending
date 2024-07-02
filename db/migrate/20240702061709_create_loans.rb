class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.string :address
      t.integer :loan_term
      t.decimal :purchase_price, precision: 10, scale: 2
      t.decimal :repair_budget, precision: 10, scale: 2
      t.decimal :arv, precision: 10, scale: 2
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
