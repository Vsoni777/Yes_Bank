module Inject
  def inject(n)
     each do |value|
       n = yield(n, value)
     end
     n
  end
  def sum(initial = 0)
    inject(initial) { |n, value| n + value }
  end
  def product(initial = 1)
    inject(initial) { |n, value| n * value }
  end
end
