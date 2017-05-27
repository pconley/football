QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"

  field :country do
    type CountryType
    argument :code, types.String
    argument :name, types.String
    resolve -> (obj, args, ctx) {
      if args[:code].present?
        Country.find_by_code(args[:code])
      elsif args[:name].present?
        Country.find_by_name(args[:name])
      else 
        Country.first
      end
    }
  end

  field :teams do
    type types[TeamType]
    argument :year, types.String
    argument :code, types.String
    argument :name, types.String
    resolve -> (obj, args, ctx) {
      if args[:year].present?
        Team.where(year: args[:year])
      elsif args[:code].present?
        country = Country.find_by_code(args[:code])
        Team.where(country: country)
      elsif args[:name].present?
        country = Country.find_by_name(args[:name])
        Team.where(country: country)
      else
        Team.all
      end
    }
  end

  field :team do
    type TeamType
    argument :code, types.String
    argument :name, types.String
    argument :year, types.String
    resolve -> (obj, args, ctx) {
      if args[:year].present?
        Team.find_by_year(args[:year])
      elsif args[:code].present?
        c = Country.find_by_code(args[:code])
        Team.find_by_country_id(c.id)
      elsif args[:name].present?
        c = Country.find_by_name(args[:name])
        Team.find_by_country_id(c.id)
      else 
        Team.first
      end
    }
  end

  field :movie do
    type MovieType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Movie.find(args[:id])
    }
  end

  field :actor do
    type ActorType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Actor.find(args[:id])
    }
  end

  field :movies do
    type types[MovieType]
    argument :year, types.Int
    resolve -> (obj, args, ctx) {
      if args[:year].present?
        Movie.where(year: args[:year])
      else
        Movie.all
      end
    }
  end

end