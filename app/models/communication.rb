class Communication < ActiveRecord::Base
  attr_accessible :type, :status, :user_id, :message

  module Status
    PENDING = 'pending'
    SENT = 'sent'
    FAILED = 'failed'
  end

  module TypeOfCommunication
    SMS = 'Communications::SmsCommunication'
    EMAIL = 'Communications::EmailCommunication'
  end

  belongs_to :user

  scope :pending, where(status: Status::PENDING)

  def mark_sent
    self.status = Status::SENT
    save
  end

  def mark_failed
    self.status = Status::FAILED
    save
  end

  def to_hash
    hash=self.serializable_hash
    hash['mobile']=self.user.mobile
    hash
  end

end
