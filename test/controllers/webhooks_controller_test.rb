require "test_helper"

class WebhooksControllerTest < ActionController::TestCase
  describe "#create" do
    it "responds with success with valid webhook" do
      pull_request_example = File.read("test/support/fixtures/pull_request_opened.json")
      post :create, body: pull_request_example, as: :json
    end
  end
end
