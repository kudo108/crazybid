class Bid < ActiveRecord::Base
  has_one :user
  belongs_to :product
  has_many :user_bids, :dependent => :destroy
  validate :rightBidTime
  
  def rightBidTime
  end
  def getRemainingTime()
    if getStatus() == _STARTED
      remain = self.bid_end_time - Time.now;
      return (remain/3600).to_i.to_s+ ":" + (remain%60).to_i.to_s+":"+((remain%60)%60).to_i.to_s
    else return 0
    end
  end
  def getStatus()
    if self.bid_start_time > Time.now
      return _READY
    end
    if self.bid_end_time > Time.now
      return _STARTED
    end
    if self.bid_end_time <= Time.now
      return _FINISHED
    end
    return _DEACTIVATE
  end
  
  def _READY
    return "Ready"
  end
  def _STARTED
    return "Started"
  end
  def _FINISHED
    return "Finished"
  end
  def _DEACTIVATED
    return "Deactivate"
  end
end