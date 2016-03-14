module Status::Helpers
  extend ActionView::Helpers::TextHelper
  extend ActionView::Helpers::NumberHelper
end

class Status::Status
  def initialize(options)
    @options = options
  end

  def render?
    true
  end

  def condition
    true
  end 

  def message
    "Message"
  end

  def extra_information 
    "Extra information"
  end

  def title
    "Title"
  end

  def style
    condition ? "green" : "orange"
  end

  private

  attr_reader :options
end 
