require 'json'

def puts_player(p)
    puts ">>> #{p.name}:#{p.birth}"
    p.teams.each { |t| puts "   #{t.year} #{t.country.name}"}
end

def clr(s)
    s.gsub(/\s+/,'')
end


namespace :db do
  task :countries => :environment do
    Country.delete_all
    File.open('./data/countries.txt','r') do |file|
        file.each do |line|
            a = line.scan(/(.*)(...)(....)(....)$/)[0]
            name = a[0]
            code = clr(a[2])
            cc = clr(a[1])
            cn = clr(a[3])
            puts ":#{code}:#{cc}:#{cn}:#{name}:"
            Country.create(name:name, code:code, cn:cn, cc:cc)
        end
    end
    puts "Countriy count = #{Country.count}"
  end
end
