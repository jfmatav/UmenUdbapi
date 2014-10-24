class AddDescripcionToSodas < ActiveRecord::Migration
  def change
    add_column :sodas, :descripcion, :string
  end
end
