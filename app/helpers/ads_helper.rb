module AdsHelper

  def fuel_type
    ['Petrol', 'Diesel', 'Electric', 'Hybrid']
  end

  def style
    ['Small cars', 'Medium cars', 'Large cars', 'MPV', 'Cabriolet', 'Coupe', 'SUV', 'State']
  end

  def color
    ['Red', 'Blue', 'Black', 'Yellow', 'Silver', 'Grey', 'Orange', 'Green', 'White']
  end

  def engine
    ['< 1000cc', '1000cc - 1500cc', '1500cc - 2000cc', '2000cc - 2500cc', '2500cc - 3500cc', '> 3500cc']
  end

  def power
    ['< 30hp', '30hp - 50hp', '50hp - 90hp', '90hp - 140hp', '140hp - 200hp', '200hp - 300hp', '> 300hp' ]
  end

end
