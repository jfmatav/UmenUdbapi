class AddPromedioToPlato < ActiveRecord::Migration
  def change
    add_column :platos, :promedio, :float
  end
end
