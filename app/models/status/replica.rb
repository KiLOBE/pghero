class Status::Replica < Status::Status
  def render?
    replica.enabled?  
  end

  def condition
    replica.good_lag? 
  end 

  def message
    condition ? "Healthy replication lag" : "High replication lag"
  end

  def extra_information 
    "#{ActionView::Helpers::NumberHelper.number_with_delimiter((replica.lag * 1000).round)} ms"
  end

  def title
    condition ? "Good" : "Warning" 
  end

  def style
    condition ? "green" : "orange"
  end

  private

  def replica
    options[:replica]
  end

  attr_reader :options
end 
