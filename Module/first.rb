require './inject'
class Array 
  include Inject
end

p (1..4).sum