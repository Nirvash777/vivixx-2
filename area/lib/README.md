Area Calculator
---------
Welcome to Area Calculator

Description
-----------
Area-Calculator was designed to calculate area of shapes

# Installation
------------
gem install area-calculator

# Usage
-----
require 'area-calculator-0.0.1.gem'

# Basic Usage
-----------
a = 2 # length of sides
puts Area.sqare(a)
# This will return [4.0]
w = 1 # width
h = 2 # height
puts Area.rectangle(w, h)
# This will return [2.0]

Others
------
Area.circle(r) # r is the radius
Area.parallelogram(b, h) # b is the base, h is the height
