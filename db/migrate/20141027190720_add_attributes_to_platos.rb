class AddAttributesToPlatos < ActiveRecord::Migration
  def change
    add_column :platos, :semana, :integer
    add_column :platos, :dia, :integer
  end
end
