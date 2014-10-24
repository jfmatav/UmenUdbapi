class AddLongToSodas < ActiveRecord::Migration
  def change
    add_column :sodas, :long, :float
  end
end
