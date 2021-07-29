# implement this module
module Runner
  def self.included base
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end
  module ClassMethods
    def run(arg)
      arg.new.process  
    end
  end
  module InstanceMethods
    def initialize(*args)
        unless args.empty?
     args = lambda {}
        end
       // args
    end
  end
end

class A
  include Runner

  def process
    puts 'A'
    {nameA: 'A'}
  end
end

class B
  include Runner

  run A

  def process
    puts 'B'
    {nameB: 'B'}
  end
end

class C < B
  def process
    puts 'C'
    {nameC: 'C'}
  end
end

class D < B
  run C

  def process
    puts 'D'
    {nameD: 'D'}
    super

    run A
  end

end

D.new({asd: 33}).()
