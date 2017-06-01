
curl -XGET http://localhost:3000/movies -d "query={ movie(id: 1) { title, year, actors { name } } }"

curl -XGET http://localhost:3000/worldcup -d "query={ countries { name } }"

curl -XGET http://localhost:3000/worldcup -d "query={ country(code: \"DEN\") { name } }"

curl -XGET http://localhost:3000/worldcup -d "query={ country(code: \"DEN\") { name, teams { year } } }"

curl -XGET http://localhost:3000/worldcup -d "query={ country(code: \"DEN\") { name, teams { year, players { name } } } }"

curl -XGET http://localhost:3000/worldcup -d "query={ team(year: \"2014\") { year } }"

curl -XGET http://localhost:3000/worldcup -d "query={ team(year: \"2014\") { year, players { name } } }"

curl -XGET http://localhost:3000/worldcup -d "query={ team(year: \"2014\") { cname, players { name } } }"

curl -XGET http://localhost:3000/worldcup -d "query={ team(code: \"DEN\") { cname, players { name } } }"

curl -XGET http://localhost:3000/worldcup -d "query={ team(code: \"DEN\") { country { name }, players { name } } }"

curl -XGET http://localhost:3000/worldcup -d "query={ teams { year } }"

curl -XGET http://localhost:3000/worldcup -d "query={ teams(code: \"BRA\") { year } }"

curl -XGET http://localhost:3000/worldcup -d "query={ teams(name: \"Brazil\") { year } }"

