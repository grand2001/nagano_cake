class RenameCutomerIdToCustomerIdInAddresses < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses, :custmer_id, :custmer_id
  end
end
