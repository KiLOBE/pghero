class Status::Connections < Status::Status
  def condition
    good_total_connections
  end 

  def message
    condition ? "Healthy number of connections" : "High number of connections"
  end

  def extra_information 
    "#{total_connections}"
  end

  def title
    condition ? "Good" : "Warning" 
  end

  def style
    condition ? "green" : "orange"
  end

  private

  def good_total_connections
    options[:good_total_connections]
  end

  def total_connections 
    options[:total_connections]
  end

  attr_reader :options
end 
