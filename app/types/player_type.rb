PlayerType = GraphQL::ObjectType.define do
  name "Player"
  description "An Footballer who played on a World Cup Team"
  field :name, types.String
  field :birth, types.String
end