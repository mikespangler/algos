require 'pry'
class Trie < Hash
  def initialize
    super
  end

  def insert(string)
    string.chars.each_with_index.inject(self) do |h, (char, i)|

      h[char] ||= {}

      if i == (string.length) - 1
        h[char][:end] = true
      end

    end
  end

  def include?(string)
    if find(string) == :end
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
    return subtree
  end
end

trie = Trie.new
trie.insert('dogs')
trie.insert('doughnut')
trie.insert('doldrums')
trie.insert('doldrum')
trie.insert('defenestrate')
# puts trie.include?('doldrum')
# puts trie.include?('doldrums')
# puts trie.include?('cocks')
puts trie.inspect
