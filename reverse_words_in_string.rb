require 'pry'

message = 'find you will pain only go you recordings security the into if'

def reverse_words(message)

  # First we reverse all the characters in the entire message.
  reverse_characters(message, 0, message.length-1)
  # This gives us the right word order,
  # but with each word backwards.

  # Now we'll make the words forward again,
  # by reversing each word's characters.

  # We hold the index of the /start/ of the current word
  # as we look for the /end/ of the current word.
  current_word_start_index = 0

  for i in 0..message.length

      # Found the end of the current word!
      if (message[i] == ' ') or (i == message.length)

          reverse_characters(message, current_word_start_index, i-1)

          # If we haven't exhausted the string,
          # our next word's start is one character ahead.
          current_word_start_index = i + 1
      end
  end

  message
end

def reverse_characters(message, front_index, back_index)

  # Walk towards the middle, from both sides.
  while front_index < back_index

      # Swap the front char and back char.
      message[front_index], message[back_index] = \
          message[back_index], message[front_index]

      front_index += 1
      back_index  -= 1

  end

  message
end

print reverse_words(message)
