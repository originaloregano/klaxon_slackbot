class SlackNotifier
  SLACKBOT_WEBHOOK = Rails.application.secrets.slackbot_webhook
  attr_reader :payload

  def initialize(payload)
    @payload = payload
  end

  def notify_channel
    HTTParty.post(SLACKBOT_WEBHOOK, body: message)
  end

  def message
    {
      text: "[tscadvantage/securehalo] Pull request #{payload.action} by <#{payload.author_link}|#{payload.author_name}>",
      author_name: payload.author_name,
      author_link: payload.author_link,
      attachments: [
        {
          title: payload.title,
          title_link: payload.html_url,
          text: payload.body,
          color: "#9AB53D",
          attachment_type: "default",
        },
      ],
    }.to_json
  end
end
