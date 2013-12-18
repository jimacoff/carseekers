module ProfilesHelper

  def positives(profile)
    positives = 0
    profile.user.wins.each do |a|
      positives += 1 if a.rating.rate == 3
    end
    positives
  end

  def neutrals(profile)
    neutrals = 0
    profile.user.wins.each do |a|
      neutrals += 1 if a.rating.rate == 2
    end
    neutrals
  end

  def negatives(profile)
    neutrals = 0
    profile.user.wins.each do |a|
      neutrals += 1 if a.rating.rate == 1
    end
    neutrals
  end

end
