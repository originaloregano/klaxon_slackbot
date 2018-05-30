require "test_helper"

class PayloadTest < ActiveSupport::TestCase
  describe "#data" do
    it "returns parsed data" do
      data = { "valid" => "valid" }
      payload = Payload.new(data.to_json)

      assert_equal payload.data, data
    end
  end

  describe "#action" do
    it "returns action data" do
      pr_example = File.read("test/support/fixtures/pull_request_opened.json")
      payload = Payload.new(pr_example)

      assert_equal payload.action, "opened"
    end
  end

  describe "#html_url" do
    it "returns html_url data" do
      pr_example = File.read("test/support/fixtures/pull_request_opened.json")
      payload = Payload.new(pr_example)

      assert_equal payload.html_url,
                   "https://github.com/baxterthehacker/public-repo/pull/1"
    end
  end

  describe "#title" do
    it "returns title data" do
      pr_example = File.read("test/support/fixtures/pull_request_opened.json")
      payload = Payload.new(pr_example)

      assert_equal payload.title, "Update the README with new information"
    end
  end

  describe "#body" do
    it "returns body data" do
      pr_example = File.read("test/support/fixtures/pull_request_opened.json")
      payload = Payload.new(pr_example)

      assert_equal payload.body,
                   "This is a pretty simple change that we need to pull into master."
    end

    describe "#author_name" do
      it "returns author_name data" do
        pr_example = File.read("test/support/fixtures/pull_request_opened.json")
        payload = Payload.new(pr_example)

        assert_equal payload.author_name, "baxterthehacker"
      end
    end

    describe "#author_link" do
      it "returns author_link data" do
        pr_example = File.read("test/support/fixtures/pull_request_opened.json")
        payload = Payload.new(pr_example)

        assert_equal payload.author_link, "https://github.com/baxterthehacker"
      end
    end
  end
end
