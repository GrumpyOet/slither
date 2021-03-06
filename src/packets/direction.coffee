message = require '../utils/message'

exports.build = (snake) ->
  buffer = new Uint8Array(8)

  b = 0
  b += message.writeInt8 b, buffer, 0
  b += message.writeInt8 b, buffer, 0

  ## Append message type
  b += message.writeInt8 b, buffer, 'e'.charCodeAt(0)

  ## Append id
  b += message.writeInt16 b, buffer, snake.id

  ## Append position values
  b += message.writeInt8 b, buffer, snake.direction.angle / 1.411764705882353
  b += message.writeInt8 b, buffer, 71
  b += message.writeInt8 b, buffer, 104

  buffer
