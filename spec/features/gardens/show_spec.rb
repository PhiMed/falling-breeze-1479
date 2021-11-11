require 'rails_helper'

RSpec.describe 'the garden show page' do

  it 'lists the plants in the gardens plots' do
    garden = Garden.create!(name: 'Christmas Garden')
    plot_1 = garden.plots.create!
    plot_2 = garden.plots.create!
    plant_1 = Plant.create!(name: 'Aloe', days_to_harvest: 98)
    plant_2 = Plant.create!(name: 'Agave', days_to_harvest: 99)
    plant_3 = Plant.create!(name: 'Hibiscus', days_to_harvest: 100)
    PlotPlant.create(plot_id: plot_1.id, plant_id: plant_1.id)
    PlotPlant.create(plot_id: plot_1.id, plant_id: plant_2.id)
    PlotPlant.create(plot_id: plot_1.id, plant_id: plant_3.id)
    PlotPlant.create(plot_id: plot_2.id, plant_id: plant_1.id)
    PlotPlant.create(plot_id: plot_2.id, plant_id: plant_2.id)
    PlotPlant.create(plot_id: plot_2.id, plant_id: plant_3.id)

    visit "/gardens/#{garden.id}"

    expect(page).to have_content(plant_1.name, count: 1)
    expect(page).to have_content(plant_2.name, count: 1)
    expect(page).not_to have_content(plant_3.name)
  end

end
