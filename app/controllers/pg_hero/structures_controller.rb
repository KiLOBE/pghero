module PgHero
  class StructuresController < ActionController::Base
    layout "pg_hero/application_v2"

    protect_from_forgery

    http_basic_authenticate_with name: ENV["PGHERO_USERNAME"], password: ENV["PGHERO_PASSWORD"] if ENV["PGHERO_PASSWORD"]

    around_filter :set_database
    before_filter :set_query_stats_enabled

    def schemas
      @schemas = PgHero.schemas
    end

    def tablespaces
      @tablespaces = PgHero.tablespaces
    end

    def tables
      @tables = PgHero.tables
    end

    def foreign_tables
      @tables = PgHero.foreign_tables
    end

    def indexes 
      @indexes = PgHero.indexes
      @graph_indexes = {}
      @indexes.each do |index|
        @graph_indexes[index["table"]] ||= 0
        @graph_indexes[index["table"]] += 1  
      end 
      @graph_information = []
      @graph_indexes.each do |k,v|
        @graph_information << [ k, v]
      end
    end

    private 

    def set_database
      @databases = PgHero.databases.values
      if params[:database]
        PgHero.with(params[:database]) do
          yield
        end
      elsif @databases.size > 1
        redirect_to url_for(params.slice(:controller, :action).merge(database: PgHero.primary_database))
      else
        yield
      end
    end

    def set_query_stats_enabled
      @queries = Dashboard::Queries.new
      @system_stats_enabled = PgHero.system_stats_enabled?
      @replica = Dashboard::Replica.new 
    end

    def default_url_options
      {database: params[:database]}
    end

  end
end 
