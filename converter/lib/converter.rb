class Converter

  def self.m_to_km(m)
    return m.to_f / 1000
  end

  def self.m_to_cm(m)
    return m.to_f * 100
  end

  def self.m_to_mm(m)
    return m.to_f * 1000
  end

  def self.km_to_m(km)
    return km.to_f * 1000
  end

  def self.km_to_cm(km)
    return km.to_f * 100000
  end

  def self.km_to_mm(km)
    return km.to_f * 1000000
  end

  def self.km_to_mi(km)
    return km.to_f * 0.62137119224
  end

  def self.c_to_f(c)
    return 9.0*c.to_f/5.0+32
  end

  def self.f_to_c(f)
    return (f.to_f-32)*5.0/9.0
  end

  def self.c_to_k(c)
    return c.to_f + 273.15
  end

  def self.cm_to_km(cm)
    return cm.to_f / 100000
  end

  def self.cm_to_m(cm)
    return cm.to_f / 100
  end

  def self.cm_to_mm(cm)
    return cm.to_f * 10
  end

  def self.cm_to_in(cm)
    return cm.to_f / 2.54
  end

  def self.in_to_cm(inch)
    return inch.to_f * 2.54
  end
end
