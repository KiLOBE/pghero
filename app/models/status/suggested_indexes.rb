class Status::SuggestedIndexes < Status::Status
  def condition
    if indexes.suggested_enabled?
      suggested.empty?
    else
      indexes.missing.empty?
    end
  end 

  def message
    if indexes.suggested_enabled?

    condition ? "No suggested indexes" : "#{Status::Helpers.pluralize(suggested.size, "suggested index", "suggested indexes")}"
    else
      condition ? "No missing indexes" : "#{Status::Helpers.pluralize(indexes.missing.size, "table appears", "tables appear")} to be missing indexes"
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

  def indexes 
    options[:indexes]
  end

  def suggested 
    options[:suggested]
  end

  attr_reader :options
end 
