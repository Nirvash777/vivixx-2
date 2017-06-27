Converter
---------
Welcome to Converter

Description
-----------
Converter was designed to ease your problem in remembering the formula of metric conversions.
Converter will do the conversions for you.

# Installation
------------
gem install converter-0.0.1.gem

# Usage
-----
require 'converter'

# Basic Usage
-----------
km = 1
puts Converter.km_to_m(km)
# This will return [1000.0]

puts Converter.c_to_f(26.1)
# This will return [78.98]

List of Converter
-----------------
km_to_mm() => Kilometer to Millimeter
km_to_m() => Kilometer to Meter
km_to_cm() => Kilometer to Centimeter
m_to_km() => Meter to Kilometer
m_to_cm() => Meter to Centimeter
m_to_mm() => Meter to Millimeter
km_to_mi() => Kilometer to Mile
c_to_f() => Celsius to Millimeter
f_to_c() => Fahrenheit to Celsius
c_to_k() => Celsius to Kelvin
cm_to_km() => Centieter to Kilometer
cm_to_mm() => Centimeter to Millimeter
cm_to_m() => CentiMeter to Meter
cm_to_in() => CentiMeter to Inches
in_to_cm() => Inches to Centimeter
*** all methods have parameter
