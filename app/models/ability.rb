class Ability < ApplicationRecord
  include CanCan::Ability

  def initialize(user)
  end
end