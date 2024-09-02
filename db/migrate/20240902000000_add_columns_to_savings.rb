class AddColumnsToSavings < ActiveRecord::Migration[7.0]
  def change
    add_column :savings, :investment, :lent
  end
end
