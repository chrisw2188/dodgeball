require('pry-byebug')
require_relative('../db/sqlrunner')

class Match

  attr_reader( :id, :home_team_score, :away_team_score,   :home_team_id, :away_team_id, :winner_id )

  def initialize (options)
    @id = options['id'].to_i
    @home_team_score = options['home_team_score'].to_i
    @away_team_score = options['away_team_score'].to_i
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @winner_id = options['winner_id']
    @teams = options['teams']
  end

  def save()
    sql = "INSERT INTO matches (home_team_score, away_team_score, home_team_id, away_team_id, winner_id) VALUES (#{home_team_score}, #{away_team_score}, #{@home_team_id}, #{@away_team_id}, #{@winner_id}) RETURNING *"
    return Match.map_item(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM matches"
    return SqlRunner.run(sql)
  end

  def self.map_items(sql)
    teams = SqlRunner.run(sql)
    result = teams.map {|team| Match.new(team)}
    return result
  end

  def self.map_item(sql)
    result = Match.map_items(sql)
    return result.first
  end

  def team

  end

  def self.winner()
    team_list = []
     sql = "SELECT teams.name FROM teams INNER JOIN matches ON teams.id = matches.winner_id;"
     teams = SqlRunner.run(sql)
     results = teams.map { |team| team_list << team.values[0] }
     return team_list
  end

  # def winner
  #   if @home_team_score > @aay_team_score
  #     winner = @home_team_id
  #   else
  #     winner = @away_team_id
  #   end
  # end

  def self.standing
    league_standings = [
      {name: 'Gentlemen', points: 0},
      {name: 'Honey Badgers', points: 0},
      {name: 'Saints', points: 0},
      {name: 'Granite City Gladiators', points: 0}
    ]
    for league_standing in league_standings
      for winner in Team.winner
        if league_standing[:name] = winner
          league_standing[:points] += 3
        end
      end
    end
    return league_standings
  end 

end