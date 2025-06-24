namespace :importDailyConsumption do
  
  desc "Importiere Verbrauchsdaten für ein Haus"
  task :daily_consumption, [:house_id, :start_date, :end_date] => :environment do |t, args|

    house = House.find(args[:house_id] )
    service = DailyConsumptionCal.new(house)
    service.import_consumption_data(start_date: args[:start_date], end_date: args[:end_date])
  end

end