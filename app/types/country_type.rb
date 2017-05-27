CountryType = GraphQL::ObjectType.define do
  name "Country"
  description "A Nation State"
  field :name, types.String
  field :code, types.String
  field :teams do
    type types[TeamType]
    argument :size, types.Int, default_value: 10
    resolve -> (country, args, ctx) {
      country.teams.limit(args[:size])
    }
  end
end