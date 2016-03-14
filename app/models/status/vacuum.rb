class Status::Vacuum < Status::Status
  def condition
    transaction_id_danger.empty?
  end 

  def message
    condition ? "Vacuuming healthy" : "#{ Status::Helpers.pluralize(transaction_id_danger.size, "table") } not vacuuming properly"
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

  def transaction_id_danger 
    options[:transaction_id_danger]
  end

  attr_reader :options
end 
