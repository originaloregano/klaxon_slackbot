require "test_helper"

class ChannelTest < ActiveSupport::TestCase
  describe "#all_messages" do
    it "should return an array of messages" do
      message = Channel.new
      message.expects(:response).returns(valid_response)

      messages = message.messages

      assert messages.is_a? Array
    end
  end

  describe "#find_message_by_title" do
    it "identifies all messages in channel by a specific title" do
      channel = Channel.new
      channel.expects(:response).returns(valid_response)

      messages = channel.find_message_by_title("Update database_cleaner from (1.5.3) to (1.6.2)")

      assert_equal "Update database_cleaner from (1.5.3) to (1.6.2)", messages.first.title
    end
  end

  def valid_response
    {
      "messages" => [
        {
        "text"=>"[tscadvantage/securehalo] Pull request closed by <https://github.com/originaloregano|originaloregano>",
        "bot_id"=>"B7C681MU4", "attachments"=>[{"text"=>"Reference:\n<https://github.com/DatabaseCleaner/database_cleaner/blob/master/History.rdoc>\n\nSee issue:\n<https://tsc-advantage.atlassian.net/browse/SH-434>",
        "title"=>"Update database_cleaner from (1.5.3) to (1.6.2)", "id"=>1,
        "title_link"=>"https://github.com/tscadvantage/securehalo/pull/703",
        "color"=>"9AB53D", "fallback"=>"Update database_cleaner from (1.5.3) to (1.6.2)"}],
        "type"=>"message", "subtype"=>"bot_message", "ts"=>"1509654395.000520"
        },
      ],
    }.to_json
  end
end
