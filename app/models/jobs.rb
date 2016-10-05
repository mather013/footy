module Jobs
  def self.all
    [SyncStandings,SyncFixtures,SyncScores].collect do |job|
      job.to_s.gsub('Jobs::', '').underscore
    end

  end
end
