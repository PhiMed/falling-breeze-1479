turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
other_garden = Garden.create!(name: 'Main Street Garden', organic: false)

turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
library_garden.plots.create!(number: 2, size: "Small", direction: "South")
other_garden.plots.create!(number: 738, size: "Medium", direction: "West")

garden = Garden.create!(name: 'Christmas Garden')
plot_1 = garden.plots.create!
plot_2 = garden.plots.create!
plant_1 = Plant.create!(name: 'Aloe')
plant_2 = Plant.create!(name: 'Agave')
PlotPlant.create(plot_id: plot_1.id, plant_id: plant_1.id)
PlotPlant.create(plot_id: plot_2.id, plant_id: plant_2.id)
