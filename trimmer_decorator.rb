require_relative 'base_decorator'
class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.length > 10 ? name[0, 10] : name
  end
end
