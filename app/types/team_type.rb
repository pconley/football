TeamType = GraphQL::ObjectType.define do
  name "Team"
  description "A group that played for a place in a given year"
  field :id, types.Int # internal id
  field :year, types.String # 2010
  field :players do
    type types[PlayerType]
    argument :size, types.Int, default_value: 10
    resolve -> (team, args, ctx) {
      team.players.limit(args[:size])
    }
  end
  field :country do
    type CountryType
    resolve -> (team, args, ctx) {
      team.country
    }
  end
  field :cname, types.String do
    resolve -> (team, args, ctx ){
      team.country.name
    }
  end
end