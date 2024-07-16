class Weather
  def initialize
    @data = File.readlines('w_data.dat').reject { |line| line.chomp.empty? }
  end

  def day_smallest_temp_spread
    smallest_spread = Float::INFINITY
    day_with_smallest_spread = ''

    @data.each do |line|
      stats = line.split
      next unless valid_stats?(stats)

      day = stats[0]
      max_temp = stats[1].to_f
      min_temp = stats[2].to_f
      spread = max_temp - min_temp

      if spread < smallest_spread
        smallest_spread = spread
        day_with_smallest_spread = day
      end
    end

    day_with_smallest_spread
  end

  private

  def valid_stats?(data)
    return false if data.length < 3
    return false unless data[0] =~ /^\d+$/
    return false unless data[1] =~ /^\d+(\.\d+)?$/
    return false unless data[2] =~ /^\d+(\.\d+)?$/
    true
  end
end

weather = Weather.new
puts "Day with the smallest temperature spread: " + weather.day_smallest_temp_spread