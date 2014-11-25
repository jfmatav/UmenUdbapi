class AddDetailsToAcompanamientos < ActiveRecord::Migration
  def change
    add_column :acompanamientos, :acompanamiento, :string
    add_column :acompanamientos, :guarnicion, :string
    add_column :acompanamientos, :ensalada1, :string
    add_column :acompanamientos, :ensalada2, :string
    add_column :acompanamientos, :ensalada3, :string
    add_column :acompanamientos, :ensalada4, :string
    add_column :acompanamientos, :ensalada5, :string
    add_column :acompanamientos, :ensalada6, :string
    add_column :acompanamientos, :fruta1, :string
    add_column :acompanamientos, :fruta2, :string
    add_column :acompanamientos, :fresco1, :string
    add_column :acompanamientos, :fresco2, :string
    add_column :acompanamientos, :frescosinazucar, :string
  end
end
