#!/usr/bin/env python
import py_compile, sys
for file in sys.argv[1:]:
  py_compile.compile(file)
