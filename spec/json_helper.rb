# frozen_string_literal: true

def parsed_response_body
  JSON.parse(response.body)
end
