module SampleModule
  extend ActiveSupport:: Concern

  def bad_words (sentence)
    words_to_check = %w(bad poor filthy dirty stupid)
    words_to_check.any? { |word| sentence.include? word}
  end

  # def self.included(including_class)
  #   including_class.extend ClassMethods
  #   has_one/belongs_to ... code
  # end

  module ClassMethods # Compulsory to use ClassMethods
    def count_vowels (vowels)
      vowels.count('aeiou')
    end
  end

  # included do
  #   has_one/belongs_to ... code
  # end
  #
  # included do
  #   has_one/belongs_to ... code
  # end
end

