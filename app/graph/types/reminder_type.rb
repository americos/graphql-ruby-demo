# type Reminder {
#   id:       String!
#   name:     String!
#   due_date: String!
#   tool:     String!
# }

ReminderType = GraphQL::ObjectType.define do
  name "Reminder"
  description "A call to action to let a user know about"

  # global_id_field :id
  field :id, types.Int, "ID for this reminder"
  field :name, !types.String, "Name for this reminder"
  field :due_date, !types.String, "Reminder Due Date"
  field :tool, !types.String, "WeddingWire tool that this reminder belongs to"
end
