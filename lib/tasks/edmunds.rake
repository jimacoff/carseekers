namespace :edmunds do

  desc "Import Car data from Edmunds Api"
  task :edmunds => [:environment] do

  make_query = Edmunds::Make.new
  all_cars = make_query.find_all

    all_cars.each do |cardata|
      Car.create({
        :make => row[1],
        :model => row[2],
      })
    end
  end
end