module PostsHelper
  def count_words(sentence)
    return 0 if sentence.empty?

    sentence.split.size
  end

  def display_for_class_names(column_name)
    class_names = Posts.get_subclasses_that_use_column(column_name)
    class_names.map { |n| 'display_for_' + n.underscore }.join(' ')
  end

  def self.get_subclasses_that_use_column(column_name)
    subs = []
    self.subclasses.each do |sub|
      subs.push(sub.to_s) if sub.uses_column?(column_name)
    end
    subs = ['all'] if subs.length == self.subclasses.length
    subs
  end
end