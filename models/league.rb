require('pry-byebug')
class League

def initialize (games, teams)
  @games = games
  @teams = teams
end

  # def match_winners
  #   @winners = []
  #   for game in @games
  #     if game.home_team_score > game.away_team_score
  #   @winners << game.home_team_id
  #       else
  #   @winners << game.away_team_id
  #     end
  #   end
  #   return @winners
  # end

  def winners()
    team_list = []
     sql = "SELECT teams.name FROM teams INNER JOIN matches ON teams.id = matches.winner_id;"
     teams = SqlRunner.run(sql)
     results = teams.map { |team| team_list << team.values[0] }
     return team_list
  end

  def standings_table()
   table = {}
   for team in @teams
    table[:name] = team.name.values[0]
    table[:points] = 0
    table[:for] =0
    table[:away] =0
    end 
    return table
  end

  def standings()
    winners = Team.winners

  end
  # def standings
  #   standings = []
  #   winners = @winners

  #   #loop round winners 
  #   #create a hash {name: "Edinburgh", points: 5}
  #   winners.each do |team_id|
  #     team = Team.find(team_id)
  #     standings_hash = {}
  #     standings_hash[team.name] = 3
  #   end

  #   return standings
  # end 

  # def team_name
  #   result[]
  #   for @winner in @winners
  #   sql = "SELECT name FROM teams WHERE name.id = #{@winner}"
  #   result << SqlRunner.run(sql)
  #   end
  #   return result
  # end

  # def self.map_items(sql)
  #   winners = SqlRunner.run(sql)
  #   result = teams.map { |winner| League.new(team) }
  #   return result
  # end

  # def self.map_item(sql)
  #   result = League.map_items(sql)
  #   return result.first
  # end

  

end

