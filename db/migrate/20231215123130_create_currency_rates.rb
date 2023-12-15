class CreateCurrencyRates < ActiveRecord::Migration[7.1]
  def change
    create_table :currency_rates do |t|
      t.date :date, null: false
      t.integer :currency_code, null: false
      t.decimal :rate, null: false

      t.index [:date, :currency_code], unique: true
      t.timestamps
    end
  end
end
