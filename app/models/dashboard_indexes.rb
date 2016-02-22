class DashboardIndexes
  def missing
    if PgHero.suggested_indexes_enabled?
      []
    else
      PgHero.missing_indexes
    end
  end

  def unused
    PgHero.unused_indexes.select { |q| q["index_scans"].to_i == 0 }
  end

  def invalid
    PgHero.invalid_indexes
  end
end
