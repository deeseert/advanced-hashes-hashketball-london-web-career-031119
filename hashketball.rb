require 'pry'
# Write your code here!
def game_hash
  {
    :home => {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1,
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7,
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15,
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5,
        }, {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1,
        }
      ]
    },

    :away => {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2,
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10,
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5,
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0,
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12,
        },
      ]
    }
  }
end


# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         binding.pry
#
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#             binding.pry
#       end
#     end
#   end
# end
#
# good_practices


def num_points_scored(name)
  answer = nil

  game_hash.each do |team, details_hash|
    # binding.pry
    players_array = details_hash[:players]
      players_array.each do |player_details_hash|
        # binding.pry
        if player_details_hash[:player_name] == name
          answer = player_details_hash[:points]
        end
      end
  end
  answer
end

def shoe_size(name)
  answer = nil

  game_hash.each do |team, details_hash|
    # binding.pry
    players_array = details_hash[:players]
      players_array.each do |player_details_hash|
        # binding.pry
        if player_details_hash[:player_name] == name
          answer = player_details_hash[:shoe]
        end
      end
  end
  answer
end




def team_colors(name)
  colors = nil
  game_hash.each do |team, team_detail_hash|
    # binding.pry
    if team_detail_hash[:team_name] == name
      colors = team_detail_hash[:colors]
    end
  end
  colors
end





def team_names
  game_hash.collect do |name, team_detail_hash|
    team_detail_hash[:team_name]
  end
end




def player_numbers (team_name)
  player_numbers_list = []
  game_hash.each do |team, team_details_hash|
    if team_details_hash[:team_name] == team_name
      team_details_hash[:players].each do |player|
        player.each do |key, value|
          if key == :number
            player_numbers_list << value
          end
        end
      end
    end
  end
  player_numbers_list
end


def player_stats(player_name)
  player_stats = {}
  game_hash.each do |team, team_details_hash|
    team_details_hash[:players].each do |stats|
      if stats[:player_name] == player_name
        stats.delete(:player_name)
        # binding.pry
        player_stats = stats
      end
    end
  end
  player_stats
end


# def player_stats(name)
#   game_hash.each do |location, attributes|
#     attributes.each do |attribute, info|
#       binding.pry
#       if info.include?(name)
#        return hash[location][attribute]
#       end
#     end
#   end
# end

def big_shoe_rebounds
  big_shoes_guy = 0
  rebounds = 0
    game_hash.each do | team, team_details_hash|
      team_details_hash[:players].each do | stats |
        if stats[:shoe] > big_shoes_guy
          big_shoes_guy = stats[:shoe]
          rebounds = stats[:rebounds]
        end
      end
    end
  rebounds
end


def most_points_scored
  most_point = 0
  player = nil
  game_hash.each do |team, team_details_hash|
    # binding.pry
    team_details_hash[:players].each do |player_name, value|
      # binding.pry
      if value[:points] > most_point
        most_point = value[:points]
        player = player_name
        # binding.pry
      end
    end
  end
  player
end

def winning_team
  home_team = 0
  away_team = 0
  game_hash[:home][:players].each do |name, value|
    home_team += value[:points]
  end
  game_hash[:away][:players].each do |name, value|
    away_team += value[:points]
  end
  if home_team > away_team
      game_hash[:home][:team_name]
  elsif home_team < away_team
      game_hash[:away][:team_name]
  else
      "It's a tie!"
  end
end

def player_with_longest_name
  longest = 0
  player_name = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, value|
      if name.length > longest
        player_name = name
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  name_with_steal = nil
  steal_number = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, value|
      if value[:steals] > steal_number
        steal_number = value[:steals]
        name_with_steal = name
      end
    end
  end
  name_with_steal == player_with_longest_name
end
