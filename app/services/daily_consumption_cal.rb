class DailyConsumptionCal

  def initialize(house)
    @house = house
  end

  def import_consumption_data(start_date:, end_date:)
    @house.units.each do |unit|

      unit.meters.each do |meter|

        location_id = meter.location_id

        url = "http://localhost:9292/values/#{location_id}/load-profile?beginDate=#{start_date}&endDate=#{end_date}"
        response = Net::HTTP.get(URI(url))
        data = JSON.parse(response)

        data.each do |entry|
          entry['values'].each do |value|
            Measurement.create!(
              meter: meter,
              value_kwh: value['value'],
              recorded_at: value['startDate']
            )
          end
        end
      end
    end
  end

  #  DailyConsumptionCal.new(Hause.first)

  def total_consumption_by_type
    meters = @house.units.map(&:meters).flatten
    

    market_meters = meters.select(&:market_location?)
    metering_meters = meters.select(&:metering_location?)

    total_market_kwh = Measurement.where(meter_id: market_meters.map(&:id)).sum(:value_kwh)
    total_metering_kwh = Measurement.where(meter_id: metering_meters.map(&:id)).sum(:value_kwh)

    {
      market: total_market_kwh,
      metering: total_metering_kwh
    }
  end


  def total_solar
    totals = total_consumption_by_type
    totals[:market] - totals[:metering]
  end

  
  def avg_solar
      from = Measurement.minimum(:recorded_at)&.to_date
      to   = Measurement.maximum(:recorded_at)&.to_date

      days = to - from
      total_solar / days
  end

end
