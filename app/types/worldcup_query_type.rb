WorldcupQueryType = GraphQL::ObjectType.define do
  name "World Cup Query"
  description "The query root for the world cup schema"

  field :countries do
    type types[CountryType]
    resolve -> (obj, args, ctx) {
      Country.all
    }
  end

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

end