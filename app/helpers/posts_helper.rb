module PostsHelper
  def count_words(sentence)
    return 0 if sentence.empty?

    sentence.split.size
  end
end