class ScheduleWorker
  include Sidekiq::Worker
  sidekiq_options queue: :schedule

  def perform(*args)
    date = Date.current
    CurrencyFetcher.call(date)
  end
end
