user = User.create(email: 'tomasdelima@gmail.com', password: 12345678)

activitables = []
accompaniables = []
experienceables = []
learnables = []

(1..10).each do |n|
  friend = User.create(email: "tomasdelima+friend_#{n}@gmail.com", password: 12345678)
  Friendship.create(friend: friend, user: user)

  activitables.push(friend)
  accompaniables.push(friend)
  experienceables.push(friend)
  learnables.push(friend)
end

(1..20).each do |m|
  activity = Activity.create(name: "Activity #{m}", activitable: activitables.sample)

  accompaniables.push(activity)
  experienceables.push(activity)
  learnables.push(activity)
end

(1..40).each do |m|
  accompaniment = Accompaniment.create(subject: "Accompaniment #{m}", accompaniable: activitables.sample)

  experienceables.push(accompaniment)
  learnables.push(accompaniment)
end

(1..80).each do |m|
  experience = Experience.create(description: "Experience #{m}", experienceable: experienceables.sample)

  learnables.push(experience)
end

(1..160).each do |m|
  learning = Learning.create(summary: "Learning #{m}", learnable: learnables.sample)
end
