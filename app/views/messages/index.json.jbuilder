json.array! @messages do |message|
  json.id message.id
  json.text message.text
  json.image message.image.url
  json.created_at message.created_time
end
