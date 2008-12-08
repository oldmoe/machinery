require 'machinery/arch'

module Machinery module Architecture

  ##
  # The Ruby 1.9 (YARV) virtual machine architecture.
  #
  # @see http://redmine.ruby-lang.org/repositories/changes/ruby-19/insns.def
  module YARV extend Architecture::StackMachine

    ##
    # The YARV instruction opcodes.
    #
    # @see http://pluskid.lifegoo.com/upload/doc/yarv/yarv_iset.html
    # @see bin/yarv-opcodes.rb
    # @see doc/yarv/opcodes-1.9.1-20438.txt
    module Opcodes
      NOP                  = 0x00 # 000
      GETLOCAL             = 0x01 # 001
      SETLOCAL             = 0x02 # 002
      GETSPECIAL           = 0x03 # 003
      SETSPECIAL           = 0x04 # 004
      GETDYNAMIC           = 0x05 # 005
      SETDYNAMIC           = 0x06 # 006
      GETINSTANCEVARIABLE  = 0x07 # 007
      SETINSTANCEVARIABLE  = 0x08 # 008
      GETCLASSVARIABLE     = 0x09 # 009
      SETCLASSVARIABLE     = 0x0A # 010
      GETCONSTANT          = 0x0B # 011
      SETCONSTANT          = 0x0C # 012
      GETGLOBAL            = 0x0D # 013
      SETGLOBAL            = 0x0E # 014
      PUTNIL               = 0x0F # 015
      PUTSELF              = 0x10 # 016
      PUTOBJECT            = 0x11 # 017
      PUTSPECIALOBJECT     = 0x12 # 018
      PUTISEQ              = 0x13 # 019
      PUTSTRING            = 0x14 # 020
      CONCATSTRINGS        = 0x15 # 021
      TOSTRING             = 0x16 # 022
      TOREGEXP             = 0x17 # 023
      NEWARRAY             = 0x18 # 024
      DUPARRAY             = 0x19 # 025
      EXPANDARRAY          = 0x1A # 026
      CONCATARRAY          = 0x1B # 027
      SPLATARRAY           = 0x1C # 028
      CHECKINCLUDEARRAY    = 0x1D # 029
      NEWHASH              = 0x1E # 030
      NEWRANGE             = 0x1F # 031
      POP                  = 0x20 # 032
      DUP                  = 0x21 # 033
      DUPN                 = 0x22 # 034
      SWAP                 = 0x23 # 035
      REPUT                = 0x24 # 036
      TOPN                 = 0x25 # 037
      SETN                 = 0x26 # 038
      ADJUSTSTACK          = 0x27 # 039
      DEFINED              = 0x28 # 040
      TRACE                = 0x29 # 041
      DEFINECLASS          = 0x2A # 042
      SEND                 = 0x2B # 043
      INVOKESUPER          = 0x2C # 044
      INVOKEBLOCK          = 0x2D # 045
      LEAVE                = 0x2E # 046
      FINISH               = 0x2F # 047
      THROW                = 0x30 # 048
      JUMP                 = 0x31 # 049
      BRANCHIF             = 0x32 # 050
      BRANCHUNLESS         = 0x33 # 051
      GETINLINECACHE       = 0x34 # 052
      ONCEINLINECACHE      = 0x35 # 053
      SETINLINECACHE       = 0x36 # 054
      OPT_CASE_DISPATCH    = 0x37 # 055
      OPT_CHECKENV         = 0x38 # 056
      OPT_PLUS             = 0x39 # 057
      OPT_MINUS            = 0x3A # 058
      OPT_MULT             = 0x3B # 059
      OPT_DIV              = 0x3C # 060
      OPT_MOD              = 0x3D # 061
      OPT_EQ               = 0x3E # 062
      OPT_NEQ              = 0x3F # 063
      OPT_LT               = 0x40 # 064
      OPT_LE               = 0x41 # 065
      OPT_GT               = 0x42 # 066
      OPT_GE               = 0x43 # 067
      OPT_LTLT             = 0x44 # 068
      OPT_AREF             = 0x45 # 069
      OPT_ASET             = 0x46 # 070
      OPT_LENGTH           = 0x47 # 071
      OPT_SUCC             = 0x48 # 072
      OPT_NOT              = 0x49 # 073
      OPT_REGEXPMATCH1     = 0x4A # 074
      OPT_REGEXPMATCH2     = 0x4B # 075
      OPT_CALL_C_FUNCTION  = 0x4C # 076
      BITBLT               = 0x4D # 077
      ANSWER               = 0x4E # 078
    end

    ##
    # The YARV instruction set.
    module Instructions extend Architecture::InstructionSet
      # TODO
    end
  end

end end
