class Soccer
  def initialize
    @data = File.readlines('soccer.dat').reject { |line| line.chomp.empty? }
  end

  def team_smallest_difference
    smallest_difference = Float::INFINITY
    team_with_smallest_difference = ''

    @data.each do |line|
      stats = line.split
      next unless valid_stats?(stats)

      team = stats[1]
      goals = stats[6].to_i
      goals_against = stats[8].to_i
      difference = (goals - goals_against).abs
      if difference < smallest_difference
        smallest_difference = difference
        team_with_smallest_difference = team
      end
    end

    team_with_smallest_difference
  end

  private

  def valid_stats?(data)
    number = data[0].match(/(\d+)/)
    number[0] if number
  end
end

soccer = Soccer.new
puts "Team with the smallest difference: " + soccer.team_smallest_difference