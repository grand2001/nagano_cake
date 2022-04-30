class RenamePostalCadeToPostalCodeInAddresses < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses, :postal_cade, :postal_code
  end
end
