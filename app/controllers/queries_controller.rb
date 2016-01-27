class QueriesController < ApplicationController
  def new
  end

  def create
    query_string = params[:query]
    query_variables = params[:variables] || {}
    # result = StarWarsSchema.execute(query_string, variables: query_variables)
    query = GraphQL::Query.new(StarWarsSchema, query_string, variables: query_variables, context: {current_user: 'americo'})
    render json: query.result
  end
end
