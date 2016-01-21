## WeddingWire Mobile Experience Pillar - graphql-ruby-demo

This repository contains a GraphQL Implementation to demo the capabilities of GraphQL using the [graphql-ruby](https://github.com/rmosolgo/graphql-ruby) gem for WeddingWire

- Try it on [heroku](https://infinite-cove-44885.herokuapp.com/).
- GraphiQL IDE is served by [graphiql-rails](https://github.com/rmosolgo/graphiql-rails)


Steps to query data
===
* Through GraphiQL (good option to test your GraphQL query)
 1. Go to :
 2. Type a sample query like:

		`
		query MyQuery{
			all_reminders: all_reminders{
				name
				tool
				due_date
			}
		}
		`
 3. Click on the Play button on the top navbar (or press ctrl + enter)
 4. The JSON response will be available on the right side

* Through CURL
 1. Open a terminal Window:
 2. Type a sample query like:

		` 
		query MyQuery{
			all_reminders: all_reminders{
				name
				tool
				due_date
			}
		}
		`
 3. You will then see the JSON response

Sample GraphQL Queries
===
* GET A SPECIFIC REMINDER

	`
	query aa{
   		specific_reminder: reminder(id: 10){
			name tool due_date
   		}
	 }
	`

	> JSON Reponse:
		
		{
 		 "data": {
		    "specific_reminder": {
		      "name": "Verify that Dad's Check went through",
		      "tool": "Budget",
		      "due_date": "2016-03-03"
		    }
		  }
		}

* GET ALL REMINDERS

	`query MyQuery{
		all_reminders: all_reminders{
			name
			tool
			due_date
		}
	 }
	`

	> JSON Response:

		{
		  "data": {
		    "all_reminders": [
		      {
		        "name": "Pay your photographer",
		        "tool": "Checklist",
		        "due_date": "2016-01-03"
		      },
		      {
		        "name": "Call your bridesmaids",
		        "tool": "Checklist",
		        "due_date": "2016-01-03"
		      },
		      {
		        "name": "Call your Wedding Planner",
		        "tool": "Checklist",
		        "due_date": "2016-02-03"
		      },
		      {
		        "name": "Verify that Dad's Check went through",
		        "tool": "Budget",
		        "due_date": "2016-03-03"
		      },
		      {
		        "name": "Pay your Florist",
		        "tool": "Checklist",
		        "due_date": "2016-04-03"
		      },
		      {
		        "name": "Ask your Fiance to reserve his tux!",
		        "tool": "Checklist",
		        "due_date": "2016-05-03"
		      },
		      {
		        "name": "Best pictures ideas for your wedding",
		        "tool": "Forums",
		        "due_date": "2016-06-03"
		      }
		    ]
		  }
		}

* GET REMINDER BY DUE DATE

	`
	query {
	  reminders_by_due_date: reminder_by_due_date(due_date: "2016-06-03"){
		name tool due_date
	  }
	}
	`

	> JSON Reponse:

		{
		  "data": {
		    "reminders_by_due_date": [
		      {
		        "name": "Best pictures ideas for your wedding",
		        "tool": "Forums",
		        "due_date": "2016-06-03"
		      }
		    ]
		  }
		}

* GET LATEST N REMINDERS (DEFAULTS TO 3)

	`
	query dd{
	  latest_reminders(count: 2){
   		 name tool due_date
  		}
	}
	`

	> JSON Response

		{
		  "data": {
		    "latest_reminders": [
		      {
		        "name": "Call your bridesmaids",
		        "tool": "Checklist",
		        "due_date": "2016-01-03"
		      },
		      {
		        "name": "Pay your photographer",
		        "tool": "Checklist",
		        "due_date": "2016-01-03"
		      }
		    ]
		  }
		}

* GET LATEST N REMINDERS USING GRAPHQL FRAGMENTS (DEFAULTS TO 3) 

	`
	query dd{
	  latest_reminders(count: 2){
		 ... reminder_info
  		}
	}
   fragment reminder_info on Reminder{
  		name, tool, due_date
	} 
	` 

	> JSON Response
	
		{
		  "data": {
		    "latest_reminders": [
		      {
		        "name": "Call your bridesmaids",
		        "tool": "Checklist",
		        "due_date": "2016-01-03"
		      },
		      {
		        "name": "Pay your photographer",
		        "tool": "Checklist",
		        "due_date": "2016-01-03"
		      }
		    ]
		  }
		}
