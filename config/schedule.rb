env :PATH, ENV['PATH']
# env :GEM_PATH, ENV['GEM_PATH']
job_type :sidekiq,  "cd :path && RAILS_ENV=:environment sidekiq-client :task :output"

set :output, error: 'error.log', standard: 'cron.log'
set :environment, :production

# every 1.hours do
#   sidekiq 'push CashWorker'
# end
# every 1.day do
#   sidekiq 'push DayWorker'
# end
every 30.minutes do
  sidekiq 'push VkWorker'
end
# every 1.day, at: '12:00'  do
#   sidekiq 'push DayWorker'
# end
# every 1.minutes do
#   sidekiq 'push DayWorker'
# end
