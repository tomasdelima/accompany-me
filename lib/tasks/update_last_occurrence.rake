namespace :update_last_occurrence do
  desc 'Updates the last_occurrence of every activity'
  task :run => :environment do
    Activity.all.each do |a|
      if a.next_occurrence && a.next_occurrence <= Date.today
        a.update_attribute(:last_occurrence, Date.today)

        puts "Activity '#{a.name}' updated"
      end
    end
  end
end