class Payload
  def initialize(unparsed_data)
    @unparsed_data = unparsed_data
  end

  def data
    @data ||= parse_data
  end

  def action
    data["action"]
  end

  def html_url
    data["pull_request"]["html_url"]
  end

  def title
    data["pull_request"]["title"]
  end

  def body
    data["pull_request"]["body"]
  end

  def author_name
    data["pull_request"]["user"]["login"]
  end

  def author_link
    data["pull_request"]["user"]["html_url"]
  end

  private

  def parse_data
    JSON.parse(@unparsed_data)
  end
end
