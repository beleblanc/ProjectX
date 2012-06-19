class AddColumnstoInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :consultation_id, :integer
    add_column :invoices, :person_id, :integer
    add_column :invoices, :invoice_date, :date
    add_column :invoices, :total, :decimal
    add_column :invoices, :discount, :float
    add_column :invoices, :person_medical_aid_id, :integer
    add_column :invoices, :payment_date, :date
    add_column :invoices, :submitted_for_claim?, :boolean
  end
end
