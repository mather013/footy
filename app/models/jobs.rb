module Jobs
  def self.all
    [SyncFixtures,SyncScores,MarkWeek].collect do |job|
      job.to_s.gsub('Jobs::', '').underscore
    end

  end
end
