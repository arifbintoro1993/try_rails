class Thought < ApplicationRecord
  belongs_to :user

  has_many :like

  validates :idea, presence: true

  def posted_at
    posted = (Time.now - self[:created_at]) / 3600
    if posted < 24 && posted > 1
      return "%dh ago" % [posted.to_i]
    elsif posted < 1 && posted > 0
      posted = posted * 60
      return "%dm ago" % [posted.to_i]
    elsif posted > 24 && posted < 48
      return "Yesterday"
    else
      return self[:created_at].strf("%d %b %Y")
    end
  end
end
