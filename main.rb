# frozen_string_literal: true

module GoogleGeminiWithRuby
  class Error < StandardError; end
  require 'faraday'
  require 'json'

  api_key = '< YOUR-API-KEY />'

  url = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent'

  headers = {
    'Content-Type' => 'application/json'
  }

  payload = {
    contents: [
      {
        parts: [
          {
            text: '
            [
             {
              "id": 1,
              "category_name": "Pizzalar",
             },
             {
              "id": 2,
              "category_name": "Burgerler",
             }
            ]
            Translate this sentence/phrase/word into [de] but keys will never change and give me the data same json format.'
          }
        ]
      }
    ]
  }

  response = Faraday.post(url) do |req|
    req.headers = headers
    req.params['key'] = api_key
    req.body = payload.to_json
  end

  puts "Response Status: #{response.status}"
  puts "Response Body: #{response.body}"
end
