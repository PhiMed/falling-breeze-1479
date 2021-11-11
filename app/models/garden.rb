class Garden < ApplicationRecord
  has_many :plots

  def unique_plants
    plots.joins(:plants).where('days_to_harvest < 100').group(:name).pluck(:name)
  end


  # .where(invoice_items: {status: '0'})

end
