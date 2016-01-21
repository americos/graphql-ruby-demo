require 'rails_helper'

describe 'ReminderType' do

  let(:context) { {} }
  let(:variables) { {} }
  let(:result){
    res = StarWarsSchema.execute(query, context: context, variables: variables)
    pp res if res['errors']
    res
  }
  let(:reminder_info_fragment){
    %|
    fragment reminder_info on Reminder{
      name, tool, due_date
    }
    |
  }

  describe "Getting an specific reminder" do
    let(:query){
      %|
      { specific_reminder: reminder(id: 1){
          ... reminder_info
        }
      }
      #{reminder_info_fragment}
      |
    }

    it 'returns just a given reminder' do
      create(:reminder, tool: 'sss')
      expect(result['data'].count).to eq 1
    end
  end

  describe "Getting all reminders" do
    let(:total_reminders){ 5 }
    let(:query){
      %|
      { all_reminders: all_reminders{
          ... reminder_info
        }
      }
      #{reminder_info_fragment}
      |
    }

    before(:each) do
      (1..total_reminders).each{|_| create(:reminder)}
    end

    it "returns the correct amount of reminders" do
      expect(result['data']['all_reminders'].count).to eq total_reminders
    end
  end
end
