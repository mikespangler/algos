require 'pry'

string = "{{{{[][()]}}}}"

def validator(string)

  # outer cannot close before inner
  a = []

  string.each_char.with_index do |char, index|
    if char == '{' || char == '[' || char == '('
      a << char
    elsif char == '}' || char == ']' || char == ')'
      
      case char
      when '}'
        mate = '{'
      when ']'
        mate = '['
      when ')'
        mate = '('
      end
            
      if a.last == mate
        a.pop
      else
        return false
      end
    end
  end
  # if any unclosed brackets
  if a.any?
    false
  else
    true
  end
end

puts validator(string)


