class Message
  SLACK_API_TOKEN = ENV["SLACK_API_TOKEN"]
  API_ENDPOINT = "https://slack.com/api/chat.delete".freeze
  attr_reader :title, :timestamp

  def initialize(params = {})
    @title = params["attachments"].try(:first).
      try(:[], "title")
    @timestamp = params["ts"]
  end

  def delete
    HTTParty.post(API_ENDPOINT, body: delete_params)
  end

  private

  def delete_params
    {
      token: SLACK_API_TOKEN,
      channel: "C6EPF3TJM",
      ts: timestamp,
    }
  end
end
