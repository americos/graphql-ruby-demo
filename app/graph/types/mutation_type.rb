MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  description "Add new Reminders"

  field :createReminder do
    type ReminderType
    description "Create a new Reminder"
    argument :name, !types.String, "Name of the new reminder"
    argument :due_date, !types.String, "Date of the new reminder"
    argument :tool, !types.String, "WeddingWire Tool this reminder belongs to"

    resolve -> (obj, args, ctx) do
      Reminder.create!(name: args[:name], due_date: args[:due_date], tool: args[:tool])
    end
  end
end
