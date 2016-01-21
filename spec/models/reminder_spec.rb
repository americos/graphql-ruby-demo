require 'rails_helper'

describe 'ReminderType' do

  let(:context) { {} }
  let(:variables) { {} }
  let(:result){
    res = StarWarsSchema.execute(query, context: context, variables: variables)
    pp res if res['errors']
    res
  }

  describe "Getting all reminders" do
    let(:number_reminders){ 5 }
    let(:query){
      %|{ all_reminders: all_reminders{ name, tool, due_date} }|
    }

    before(:each) do
      (1..number_reminders).each{|_| create(:reminder)}
    end

    it "returns the correct amount of reminders" do
      expect(result['data']['all_reminders'].count).to eq number_reminders
    end
  end
end
