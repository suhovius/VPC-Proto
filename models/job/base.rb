class Job::Base

  attr :options

  def initialize options = {}
    raise "Can't initialize an abstract class instance" if self.class == Job::Base
    @options = options
  end

  def perform
    raise 'Not inmplemeted'
  end

end

