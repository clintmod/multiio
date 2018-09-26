require "multiio/version"

class MultiIO

  def self.delegate_all
    IO.methods.each do |m|
      define_method(m) do |*args|
        ret = nil
        @targets.each { |t| ret = t.send(m, *args) }
        ret
      end
    end
  end

  def initialize(*targets)
    @targets = targets
    MultiIO.delegate_all
  end

end
