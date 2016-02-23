class DashboardQueries
  def stats_enabled?
    @query_stats_enabled ||= PgHero.query_stats_enabled?
  end

  def stats_available?
    @query_stats_available ||= PgHero.query_stats_available?
  end

  def long_running
    @long_running_queries ||= PgHero.long_running_queries
  end 

  def slow
    @slow_queries ||= PgHero.slow_queries(query_stats: @query_stats)
  end

  def stats
    @query_stats ||= PgHero.query_stats(historical: true, start_at: 3.hours.ago)
  end
end

