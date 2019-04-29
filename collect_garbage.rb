require 'allocation_stats'

class Stuff
  def initialize()
    @@stuff = []
    10.times do
      @@stuff << 'some clutter from the forgotten dungones in my computers memory'
    end
  end
end

class KeepTheGarbage
  def self.create_stuff
    @@stuff = Stuff.new
  end
end

stats = AllocationStats.trace { KeepTheGarbage.create_stuff }

# Force the garbate collection
GC

# Notice the garbage collecter cant collect the @@stuff because there is nothing going out of scope
puts stats.allocations(alias_paths: true).to_text