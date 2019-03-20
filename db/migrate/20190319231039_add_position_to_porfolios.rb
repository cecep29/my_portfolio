class AddPositionToPorfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :porfolios, :position, :integer
  end
end
