set :output, "#{path}/log/cron_log.logs"
set :environment, :production
env :PATH, ENV['PATH']
job_type :rbenv_rake, %q!eval "$(rbenv init -)"; cd :path && :environment_variable=:environment bundle exec rake :task --silent :output!

every :day, at: '12pm' do
  rake 'send_digest_email'
end
