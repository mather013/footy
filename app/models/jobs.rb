module Jobs
  def self.all
    [Jobs::Syncing::SyncFixtures, Jobs::Syncing::SyncScores, Jobs::MarkWeek].collect do |job|
      job.to_s.gsub('Jobs::', '').underscore
    end

  end
end
