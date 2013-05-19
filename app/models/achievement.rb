class Achievement

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def pints_count
    user.donations.count
  end

  def people_saved
    pints_count * 3
  end

  def message
    if pints_count == 1
      "two teacup pigs"
    elsif pints_count == 2
      "the Holy Grail (est.)"
    elsif pints_count == 5
      "a heart surgery"
    elsif pints_count == 9
      "the Stanley Cup"
    elsif pints_count == 13
      "a case of beer"
    elsif pints_count == 50
      "a car accident victim"
    elsif pints_count == 54
      "the Queen of England's corgis"
    end
  end

  def in_app_message
    "Thanks for giving blood: you've donated as much as #{message}."
  end

  def social_message
    "I gave blood today and have donated a total volume of blood equivalent to #{message} - using drip"
  end

  def celebrate
    user.broadcast(social_message)
  end

end
