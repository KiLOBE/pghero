class Status::SlowQueries < Status::Status
  def condition
    queries.stats_enabled? && queries.slow.empty? 
  end 

  def message
    if !queries.stats_enabled?
      "Query stats must be enabled for slow queries"
    elsif queries.slow.any? 
      "#{Status::Helpers.pluralize(queries.slow.size, "slow query")}" 
    else
      "No slow queries"
    end
  end

  def extra_information 
    ""
  end

  def title
    condition ? "Good" : "Warning" 
  end

  def style
    condition ? "green" : "orange"
  end

  private

  def queries 
    options[:queries]
  end

  attr_reader :options
end 
