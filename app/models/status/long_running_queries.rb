class Status::LongRunningQueries < Status::Status
  def condition
    queries.long_running.empty? 
  end 

  def message
    condition ? "No long running queries" : ActionView::Helpers::TextHelper.pluralize(queries.long_running.size, "long running query") 
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
