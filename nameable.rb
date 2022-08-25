class Nameable
  def correct_name
    # The raise keyword throw an exception that we can handle it with rescue.
    #  In here it throws an exception which the names are corrct or not?
    # NotImplementedError is a method that referenced to a function
    #  that can not executed inside program
    raise NotImplementedError("#{self.class} has not implemented method '#{__method__}'")
  end
end
