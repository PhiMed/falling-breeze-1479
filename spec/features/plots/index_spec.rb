require 'rails_helper'

RSpec.describe 'the plots index page' do

  it 'lists the plot numbers and plants' do
    garden = Garden.create!(name: 'Christmas Garden')
    plot_1 = garden.plots.create!
    plot_2 = garden.plots.create!
    plant_1 = Plant.create!(name: 'Aloe')
    plant_2 = Plant.create!(name: 'Agave')
    PlotPlant.create(plot_id: plot_1.id, plant_id: plant_1.id)
    PlotPlant.create(plot_id: plot_2.id, plant_id: plant_2.id)

    visit '/plots'

    expect(page).to have_content("Plot Number: #{plot_1.id}")
    expect(page).to have_content("Plot Number: #{plot_2.id}")

    within("#plot-#{plot_1.id}") do
      expect(page).to have_content("Aloe")
      expect(page).not_to have_content("Agave")
    end

    within("#plot-#{plot_2.id}") do
      expect(page).to have_content("Agave")
      expect(page).not_to have_content("Aloe")
    end
  end

  it 'can remove a plant from a plot' do
    garden = Garden.create!(name: 'Christmas Garden')
    plot_1 = garden.plots.create!
    plot_2 = garden.plots.create!
    plant_1 = Plant.create!(name: 'Aloe')
    plant_2 = Plant.create!(name: 'Agave')
    PlotPlant.create(plot_id: plot_1.id, plant_id: plant_1.id)
    PlotPlant.create(plot_id: plot_2.id, plant_id: plant_2.id)

    visit '/plots'

    within("#plot-#{plot_1.id}") do
      expect(page).to have_content("Aloe")
      expect(page).to have_button("Remove this plant")

      click_button

      expect(page).not_to have_content("Aloe")
    end
  end
end
