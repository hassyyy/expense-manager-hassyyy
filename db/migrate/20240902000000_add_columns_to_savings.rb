class AddColumnsToSavings < ActiveRecord::Migration[7.0]
  def change
    add_column :savings, :investment, :boolean
    add_column :savings, :lent, :boolean
  end
end
