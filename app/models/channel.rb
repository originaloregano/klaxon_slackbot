class Channel
  SLACK_API_TOKEN = ENV["SLACK_API_TOKEN"]
  API_ENDPOINT = "https://slack.com/api/channels.history".freeze

  def messages
    @messages ||= create_messsages
  end

  def create_messsages
    parsed_response["messages"].map do |message_params|
      Message.new(message_params)
    end
  end

  def find_message_by_title(title)
    messages.select { |message| message.title == title }
  end

  private

  def response
    HTTParty.post(API_ENDPOINT, body: request).response.body
  end

  def request
    {
      token: SLACK_API_TOKEN,
      channel: "C6EPF3TJM",
    }
  end

  def parsed_response
    JSON.parse(response)
  end
end
