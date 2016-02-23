class DashboardReplica
  def enabled? 
    @replica ||= PgHero.replica?
  end

  def lag
    @lag ||= PgHero.replication_lag
  end

  def good_lag?
    lag < 5
  end
end
