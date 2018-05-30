class WebhooksController < ApplicationController
  def create
    SlackNotifier.new(payload).notify_channel
  end

  private

  def payload
    @payload ||= Payload.new(request.raw_post)
  end
end
