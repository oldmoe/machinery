#!/usr/bin/env python
from dis import *
for op in xrange(256):
  name = opname[op]
  if name.startswith('<'):
    continue
  if name.endswith('+0'):
    print "%-20s = 0x%02x # %03d" % (name[:-2], op, op)
  print "%-20s = 0x%02x # %03d" % (name, op, op)
