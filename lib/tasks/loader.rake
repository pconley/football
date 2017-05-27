require 'json'

def puts_player(p)
    puts ">>> #{p.name}:#{p.birth}"
    p.teams.each { |t| puts "   #{t.year} #{t.country.name}"}
end

def load_player_and_team(p,country)

    team = Team.where(year: p['Year'], country_id: country.id).first_or_create

    name = p['FullName']
    posn = p['Position']
    birth = p['DateOfBirth']

    if name != '' # some data are blank
        player = Player.where(name: name, birth: birth).first_or_create 
        membership = Membership.create(player_id: player.id, team_id: team.id, position: posn, isCaptain: false)
        puts_player(player)
    end
end

def get_country(str)

    if str.length == 3
        Country.find_by_code(str)
    else
        Country.find_by_name(str)
    end
    
end

##### ASSUMES COUNTRIES ARE LOADED

namespace :db do
  task :loader => :environment do

    Player.delete_all
    Team.delete_all

    not_found = {}

    file = File.read('./data/massive-set.json')
    array = JSON.parse(file)
    array.each do |p|
        cname = p['Team']
        country = get_country(cname.strip)
        if country 
            load_player_and_team(p,country)
        else
            # puts "Country not found: #{cname}"
            not_found[cname.strip] = true
        end

    end
    puts "Team count = #{Team.count}"
    puts "Player count = #{Player.count}"
    puts "Country count = #{Country.count}"
    if not_found.keys.length > 0 
        puts "Not Found:"
        not_found.keys.each do |key| 
            if key.length == 3
                puts "xxxxxxxxx xx #{key}	999" 
            else
                puts "#{key} xx	xxx	999" 
            end 
        end
    end
    
  end
end
