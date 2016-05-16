require_relative('models/match.rb')
require_relative('models/team.rb')
require_relative('models/league.rb')

require('pry-byebug')

Match.delete_all
Team.delete_all

team1 = Team.new({'name' => 'Gentlemen', 'location' => 'Edinburgh'})
team2 = Team.new({'name' => 'Saints', 'location' => 'St Andrews'})
team3 = Team.new({'name' => 'Honey Badgers', 'location' => 'Glasgow'})
team4 = Team.new({'name' => 'Granite City Gadiators', 'location' => 'Aberdeen'})

t1 = team1.save()
t2 = team2.save()
t3 = team3.save()
t4 = team4.save()


game1 = Match.new({'home_team_score' => 10, 'away_team_score' => 5, 'home_team_id' => t1.id, 'away_team_id' => t2.id, 'winner_id' => t1.id})
game2 = Match.new({'home_team_score' => 2, 'away_team_score' => 7, 'home_team_id' => t1.id, 'away_team_id' => t3.id, 'winner_id' => t3.id})
game3 = Match.new({'home_team_score' => 5, 'away_team_score' => 4, 'home_team_id' => t1.id, 'away_team_id' => t4.id, 'winner_id' => t1.id})
game4 = Match.new({'home_team_score' => 7, 'away_team_score' => 8, 'home_team_id' => t2.id, 'away_team_id' => t3.id, 'winner_id' => t3.id})
game5 = Match.new({'home_team_score' => 19, 'away_team_score' => 10, 'home_team_id' => t2.id, 'away_team_id' => t4.id, 'winner_id' => t2.id})
game6 = Match.new({'home_team_score' => 13, 'away_team_score' => 7, 'home_team_id' => t3.id, 'away_team_id' => t4.id, 'winner_id' => t3.id})
game7 = Match.new({'home_team_score' => 7, 'away_team_score' => 9, 'home_team_id' => t2.id, 'away_team_id' => t1.id, 'winner_id' => t1.id})
game8 = Match.new({'home_team_score' => 11, 'away_team_score' => 9, 'home_team_id' => t3.id, 'away_team_id' => t1.id, 'winner_id' => t3.id})
game9 = Match.new({'home_team_score' => 7, 'away_team_score' => 10, 'home_team_id' => t4.id, 'away_team_id' => t1.id, 'winner_id' => t1.id})
game10 = Match.new({'home_team_score' => 5, 'away_team_score' => 3, 'home_team_id' => t3.id, 'away_team_id' => t2.id, 'winner_id' => t3.id})
game11 = Match.new({'home_team_score' => 7, 'away_team_score' => 11, 'home_team_id' => t4.id, 'away_team_id' => t2.id, 'winner_id' => t2.id})
game12 = Match.new({'home_team_score' => 6, 'away_team_score' => 5, 'home_team_id' => t4.id, 'away_team_id' => t3.id, 'winner_id' => t4.id})

g1 = game1.save
g2 = game2.save
g3 = game3.save
g4 = game4.save
g5 = game5.save
g6 = game6.save
g7 = game7.save
g8 = game8.save
g9 = game9.save
g10 = game10.save
g11 = game11.save
g12 = game12.save

@teams = [t1, t2,t3, t4]

@games = [g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12]

binding.pry
nil


