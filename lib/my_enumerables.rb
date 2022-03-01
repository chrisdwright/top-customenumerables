module Enumerable

  def my_each_with_index
    index = 0
    for el in self
      yield el, index
      index += 1
    end
  end

  def my_select
    selected = []
    for el in self
      selected << el if yield el
    end
    selected
  end

  def my_all?
    all = true
    for el in self
      all = false unless yield el
    end
    all
  end

  def my_any?
    any = false
    for el in self
      if yield el
        any = true
        break
      end
    end
    any
  end

  def my_none?
    none = true
    for el in self
      if yield el
        none = false
        break
      end
    end
    none
  end

  def my_count
    return self.length unless block_given?

    count = 0
    for el in self
      count += 1 if yield el
    end
    count
  end

  def my_map
    mapped = []
    for el in self
      mapped << yield(el)
    end
    mapped
  end

  def my_inject(v)
    value = v
    for el in self
      value = yield(value, el)
    end
    value
  end

end

class Array

  def my_each
    for el in self
      yield el
    end
    self
  end

end