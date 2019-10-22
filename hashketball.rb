# Write your code here!
AA={:player_name =>"Alan Anderson",:number => 0, :shoe => 16,:points => 22,:rebounds => 12,:assists =>12,:steals => 3,:blocks => 1,:slam_dunks => 1}
RE={:player_name =>"Reggie Evans",:number => 30, :shoe => 14,:points => 12,:rebounds => 12,:assists =>12,:steals => 12,:blocks => 12,:slam_dunks => 7}
BL={:player_name =>"Brook Lopez",:number => 11, :shoe => 17,:points => 17,:rebounds => 19,:assists =>10,:steals => 3,:blocks => 1,:slam_dunks => 15}
MP={:player_name =>"Mason Plumlee",:number => 1, :shoe => 19,:points => 26,:rebounds => 11,:assists =>6,:steals => 3,:blocks => 8,:slam_dunks => 5}
JT={:player_name =>"Jason Terry",:number => 31, :shoe => 15,:points => 19,:rebounds => 2,:assists =>2,:steals => 4,:blocks => 11,:slam_dunks => 1}
JA={:player_name =>"Jeff Adrien",:number => 4, :shoe => 18,:points => 10,:rebounds => 1,:assists =>1,:steals => 2,:blocks => 7,:slam_dunks => 2}
BB={:player_name =>"Bismack Biyombo",:number =>0, :shoe => 16,:points => 12,:rebounds => 4,:assists =>7,:steals => 22,:blocks => 15,:slam_dunks => 10}
DD={:player_name =>"DeSagna Diop",:number => 2, :shoe => 14,:points => 24,:rebounds => 12,:assists =>12,:steals => 4,:blocks => 5,:slam_dunks => 5}
BG={:player_name =>"Ben Gordon",:number => 8, :shoe => 15,:points => 33,:rebounds => 3,:assists =>2,:steals => 1,:blocks => 1,:slam_dunks => 0}
KW={:player_name =>"Kemba Walker",:number => 33, :shoe => 15,:points => 6,:rebounds => 12,:assists =>12,:steals => 7,:blocks => 5,:slam_dunks => 12}


def game_hash()
  new_hash={:home => {},:away => {}}
  home_players=[AA,RE,BL,MP,JT]
  away_players=[JA,BB,DD,BG,KW]
  home_team={:team_name => {}, :colors => {}, :players => home_players}
  away_team={:team_name => {}, :colors => {}, :players => away_players}
  home_colors=["Black","White"]
  away_colors=["Turquoise","Purple"]
  home_name="Brooklyn Nets"
  away_name="Charlotte Hornets"
  home_team={:team_name => home_name, :colors => home_colors, :players => home_players}
  away_team={:team_name => away_name, :colors => away_colors, :players => away_players}
  new_hash={:home => home_team,:away => away_team}
 
end

def num_points_scored(name)
  game_data=game_hash()
  result=[]
  game_data.each_value do |value|
    value[:players].each do |value1|
      if value1[:player_name] == name
        result << value1[:points]
      end
    end
  end
  result[0]
end

def shoe_size(name)
  game_data=game_hash()
  result=[]
  game_data.each_value do |value|
    value[:players].each do |value1|
      if value1[:player_name] == name
        result << value1[:shoe]
      end
    end
  end
  result[0]
end
def team_colors(team_name)
  game_data=game_hash()
  result=[]
  game_data.each_value do |value|
    if value[:team_name]==team_name
      result << value[:colors]
    end
  end
  result[0]
end

def team_names()
  game_data=game_hash()
  result=[]
  game_data.each_value do |value|
    result << value[:team_name]
  end
  result
end

def player_numbers(team_name)
  game_data=game_hash()
  result=[]
  game_data.each_value do |value|
    value[:players].each do |value1|
      if value[:team_name]==team_name
        result << value1[:number]
      end
    end
  end
  result
end
def player_stats(name)
  game_data=game_hash()
  result=[]
  game_data.each_value do |value|
    value[:players].each do |value1|
      if value1[:player_name] == name
        value1.delete(:player_name)
        result << value1
      end
    end
  end
  result[0]
end
def big_shoe_rebounds()
  game_data=game_hash()
  result=0
  rebounds=0
  game_data.each_value do |value|
    value[:players].each do |value1|
      if value1[:shoe] > result
        result=value1[:shoe]
        rebounds = value1[:rebounds]
      else
        result
        rebounds
      end
    end
  end
  rebounds
end

def high_points()
  game_data=game_hash()
  result=0
  game_data.each_value do |value|
    value[:players].each do |value1|
      if value1[:points]>result
        result=value1[:points]
      else
        result
      end
    end
  end
  result
end

def most_points_scored()
  max_points=high_points()
  game_data=game_hash()
  result=""
  game_data.each_value do |value|
    value[:players].each do |value1|
      if value1[:points]==max_points
        result = value1[:player_name]
      end
    end
  end
  result
end



#def most_points_scored()
#  game_data=game_hash()
#  result=0
#  names=""
#  game_data.each_value do |value|
#    value[:players].each do |value1|
#      if value1[:points] > result
#        result= value1[:points]
#        names = value1[:player_name]
#      else
#        result
#        names
#      end
#    end
#  end
#  names
#end


def sum_scores(team_name)
  game_data=game_hash()
  result=[]
  game_data.each_value do |value|
    if value[:team_name]==team_name
      value[:players].each do |value1|
        result << value1[:points]
      end
    end
  end
  result.sum
end
#puts "#{sum_scores("Brooklyn Nets")}"
def winning_team()
  game_data=game_hash()
  totals={}
  teams={}
  result={}
  game_data.each_value do |value|
    totals= sum_scores(value[:team_name])
    teams = value[:team_name]
    result[teams]=totals
  end
  max=0
  team=""
  result.each do |k,v|
    if v>max
      max=v
      team=k
    else
      max
      team
    end
  end
  team
end

def names_length()
  result={}
  lengths=[]
  names=[]
  game_data=game_hash
  game_data.each_value do |value|
    value[:players].map do |value1|
      lengths << value1[:player_name].length
      names << value1[:player_name]
    end
  end
  i=0
  while i<names.length
    result[names[i]]=lengths[i]
    i+=1
  end
  result
end

def player_with_longest_name()
  name_length=names_length()
  max=0
  name=""
  name_length.each do |k,v|
    if v>max
      max=v
      name=k
    else
      max
      name
    end
  end
  name
end

#def long_name_steas_a_ton?
#end
  






