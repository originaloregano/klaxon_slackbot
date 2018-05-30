require "test_helper"

class MessageTest < ActiveSupport::TestCase
  describe "#title" do
    it "returns title" do
      message = Message.new(valid_message_params)

      assert_equal message.title, "Remove insurance assessment traits from factories"
    end
  end

  describe "#timestamp" do
    it "returns timestamps" do
      message = Message.new(valid_message_params)

      assert_equal message.timestamp, "1510201204.000008"
    end
  end

  describe "#delete" do
    it "deletes a message from channel based on the message timestamp" do
      message = Message.new(valid_message_params)
      delete_params = {
        token: Message::SLACK_API_TOKEN,
        channel: "C6EPF3TJM",
        ts: message.timestamp,
      }
      HTTParty.expects(:post).with(Message::API_ENDPOINT, body: delete_params)

      message.delete
    end
  end

  def valid_message_params
    {"text"=>"[tscadvantage/securehalo] Pull request synchronize by <https://github.com/luminous14|luminous14>",
      "bot_id"=>"B7C681MU4",
      "attachments"=>[
        {"text"=>"* Remove new and submitted insurance application traits\n* Create NewInsuranceAssessmentPrimer for dev.rake\n* Refactor tests to accommodate changes to factories",
        "title"=>"Remove insurance assessment traits from factories",
        "id"=>1, "title_link"=>"https://github.com/tscadvantage/securehalo/pull/723",
        "color"=>"9AB53D", "fallback"=>"Remove insurance assessment traits from factories"}
        ],
        "type"=>"message", "subtype"=>"bot_message", "ts"=>"1510201204.000008"
      }
  end
end
