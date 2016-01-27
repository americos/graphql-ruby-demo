# type Query {
#   hero: Character
#   human(id: String!): Human
#   droid(id: String!): Droid
# }
QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"

  # You can define fields on the fly:
  # field :hero do
  #   type -> { !CharacterInterface }
  #   description "The hero of the saga"
  #
  #   argument :episode, EpisodeEnum, "If provided, return the hero of that episode"
  #
  #   resolve -> (obj, args, ctx) do
  #     args["episode"] == 5 ? Human.find(1000) : Droid.find(2001)
  #   end
  # end
  #
  # field :human, HumanType, field: FetchField.new(type: HumanType, model: Human)
  # field :droid, DroidType, field: FetchField.new(type: DroidType, model: Droid)
  # field :node, field: NodeIdentification.field

  field :reminder, ReminderType, field: FetchField.new(type: ReminderType, model: Reminder)
  field :all_reminders do
    type GraphQL::ListType.new(of_type: ReminderType)
    description "Get all reminders"

    resolve -> (obj, args, ctx) do
      #Sample of how we can potentially check the ctx object for cancan abilities
      if ctx[:current_user] == 'americo'
        Reminder.all
      else
        []
      end
    end
  end
  field :reminder_by_due_date do
    type GraphQL::ListType.new(of_type: ReminderType)
    description "Get a reminder by due date"
    argument :due_date, !types.String, "Returns the list of reminders on a given due date"

    resolve -> (obj, args, ctx) do
      Reminder.where(due_date: args[:due_date])
    end
  end
  field :latest_reminders do
    type GraphQL::ListType.new(of_type: ReminderType)
    description "Get the latest X reminders order by due date (defaults to 3)"
    argument :count, types.Int, "Number of latest reminders to return", default_value: 3

    resolve -> (obj, args, ctx) do
      Reminder.order(:due_date).first(args[:count])
    end
  end
end
