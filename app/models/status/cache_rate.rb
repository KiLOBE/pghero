class Status::CacheRate < Status::Status
  def condition
    good_cache_rate 
  end 

  def message
    condition ? "Cache hit rate above #{PgHero.cache_hit_rate_threshold}" : "Low cache hit rate"
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

  def good_cache_rate 
    options[:good_cache_rate]
  end

  attr_reader :options
end 
