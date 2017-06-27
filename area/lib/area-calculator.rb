class Area

  def self.square(a)
    return a.to_f * a.to_f
  end

  def self.circle(r)
    return 3.14159 * (r.to_f * r.to_f)
  end

  def self.rectangle(w, h)
    return w.to_f + h.to_f
  end

  def self.parallelogram(b, h)
    return b.to_f * h.to_f
  end

end
