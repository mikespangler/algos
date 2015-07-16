require 'pry'
class Trie < Hash
  def initialize
    super
  end

  def insert(string)
    string.chars.each_with_index.inject(self) do |h, (char, i)|

      if i == (string.length) - 1
        h[char] ||= {}
        h[char][:end] = true
      end

      h[char] ||= {}
    end
  end

  def include?(string)
    if find(string) && find(string).has_key?(:end)
      true
    else
      false
    end
  end

  def find(string)
    subtree = self
    string.chars.each do |char|
      subtree = subtree[char]
      return false if subtree.nil?
    end
    subtree
  end
end

trie = Trie.new
trie.insert('dogs')
trie.insert('doughnut')
trie.insert('doldrums')
trie.insert('doldrum')
trie.insert('defenestrate')
puts trie.include?('doldrumo')
puts trie.include?('doldrums')
puts trie.include?('kombucha')
puts trie.inspect
