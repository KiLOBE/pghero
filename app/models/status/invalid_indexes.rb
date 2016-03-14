class Status::InvalidIndexes < Status::Status
  def condition
    indexes.empty? 
  end 

  def message
    condition ? "No invalid indexes" : "#{Status::Helpers.pluralize(indexes.size, "invalid index", "invalid indexes")}"
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

  def indexes 
    options[:indexes]
  end

  attr_reader :options
end 
