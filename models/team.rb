require_relative('../db/sqlrunner')

class Team

  attr_reader( :id, :name, :location)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @location = options['location']
  end

  def save()
    sql = "INSERT INTO teams (name, location) 
    VALUES ('#{name}', '#{location}')
    RETURNING *"
    return Team.map_item(sql)
  end

  def self.delete_all
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end

  def self.find()
    team_list = []
     sql = "SELECT teams.name FROM teams INNER JOIN matches ON matches.home_team_id = teams.id;"
     teams = SqlRunner.run(sql)
     results = teams.map { |team| team_list << team.values[0] }
     return team_list
  end

  # def team_list
  #   teams_list = Team.find
  #   teams 
  # end

  def self.map_items(sql)
    teams = SqlRunner.run(sql)
    result = teams.map { |team| Team.new(team) }
    return result
  end

  def self.map_item(sql)
    result = Team.map_items(sql)
    return result.first
  end


end

