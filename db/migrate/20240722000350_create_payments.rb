# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.string :user_name
      t.string :user_email
      t.decimal :transaction_amount

      t.timestamps
    end
  end
end
