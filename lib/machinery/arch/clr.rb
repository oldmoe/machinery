require 'machinery/arch'

module Machinery module Architecture

  ##
  # The Common Language Runtime (CLR, or CIL aka MSIL) architecture.
  #
  # @see http://www.ecma-international.org/publications/standards/Ecma-335.htm
  module CLR extend Architecture::StackMachine

    ##
    # The CLR instruction opcodes.
    #
    # @see http://msdn.microsoft.com/en-us/library/system.reflection.emit.opcodes_members.aspx
    module Opcodes
      NOP                  = 0x00 # 000
      BREAK                = 0x01 # 001
      LDARG_0              = 0x02 # 002
      LDARG_1              = 0x03 # 003
      LDARG_2              = 0x04 # 004
      LDARG_3              = 0x05 # 005
      LDLOC_0              = 0x06 # 006
      LDLOC_1              = 0x07 # 007
      LDLOC_2              = 0x08 # 008
      LDLOC_3              = 0x09 # 009
      STLOC_0              = 0x0A # 010
      STLOC_1              = 0x0B # 011
      STLOC_2              = 0x0C # 012
      STLOC_3              = 0x0D # 013
      LDARG_S              = 0x0E # 014
      LDARGA_S             = 0x0F # 015
      STARG_S              = 0x10 # 016
      LDLOC_S              = 0x11 # 017
      LDLOCA_S             = 0x12 # 018
      STLOC_S              = 0x13 # 019
      LDNULL               = 0x14 # 020
      LDC_I4_M1            = 0x15 # 021
      LDC_I4_0             = 0x16 # 022
      LDC_I4_1             = 0x17 # 023
      LDC_I4_2             = 0x18 # 024
      LDC_I4_3             = 0x19 # 025
      LDC_I4_4             = 0x1A # 026
      LDC_I4_5             = 0x1B # 027
      LDC_I4_6             = 0x1C # 028
      LDC_I4_7             = 0x1D # 029
      LDC_I4_8             = 0x1E # 030
      LDC_I4_S             = 0x1F # 031
      LDC_I4               = 0x20 # 032
      LDC_I8               = 0x21 # 033
      LDC_R4               = 0x22 # 034
      LDC_R8               = 0x23 # 035
      DUP                  = 0x25 # 037
      POP                  = 0x26 # 038
      JMP                  = 0x27 # 039
      CALL                 = 0x28 # 040
      CALLI                = 0x29 # 041
      RET                  = 0x2A # 042
      BR_S                 = 0x2B # 043
      BRFALSE_S            = 0x2C # 044
      BRTRUE_S             = 0x2D # 045
      BEQ_S                = 0x2E # 046
      BGE_S                = 0x2F # 047
      BGT_S                = 0x30 # 048
      BLE_S                = 0x31 # 049
      BLT_S                = 0x32 # 050
      BNE_UN_S             = 0x33 # 051
      BGE_UN_S             = 0x34 # 052
      BGT_UN_S             = 0x35 # 053
      BLE_UN_S             = 0x36 # 054
      BLT_UN_S             = 0x37 # 055
      BR                   = 0x38 # 056
      BRFALSE              = 0x39 # 057
      BRTRUE               = 0x3A # 058
      BEQ                  = 0x3B # 059
      BGE                  = 0x3C # 060
      BGT                  = 0x3D # 061
      BLE                  = 0x3E # 062
      BLT                  = 0x3F # 063
      BNE_UN               = 0x40 # 064
      BGE_UN               = 0x41 # 065
      BGT_UN               = 0x42 # 066
      BLE_UN               = 0x43 # 067
      BLT_UN               = 0x44 # 068
      SWITCH               = 0x45 # 069
      LDIND_I1             = 0x46 # 070
      LDIND_U1             = 0x47 # 071
      LDIND_I2             = 0x48 # 072
      LDIND_U2             = 0x49 # 073
      LDIND_I4             = 0x4A # 074
      LDIND_U4             = 0x4B # 075
      LDIND_I8             = 0x4C # 076
      LDIND_I              = 0x4D # 077
      LDIND_R4             = 0x4E # 078
      LDIND_R8             = 0x4F # 079
      LDIND_REF            = 0x50 # 080
      STIND_REF            = 0x51 # 081
      STIND_I1             = 0x52 # 082
      STIND_I2             = 0x53 # 083
      STIND_I4             = 0x54 # 084
      STIND_I8             = 0x55 # 085
      STIND_R4             = 0x56 # 086
      STIND_R8             = 0x57 # 087
      ADD                  = 0x58 # 088
      SUB                  = 0x59 # 089
      MUL                  = 0x5A # 090
      DIV                  = 0x5B # 091
      DIV_UN               = 0x5C # 092
      REM                  = 0x5D # 093
      REM_UN               = 0x5E # 094
      AND                  = 0x5F # 095
      OR                   = 0x60 # 096
      XOR                  = 0x61 # 097
      SHL                  = 0x62 # 098
      SHR                  = 0x63 # 099
      SHR_UN               = 0x64 # 100
      NEG                  = 0x65 # 101
      NOT                  = 0x66 # 102
      CONV_I1              = 0x67 # 103
      CONV_I2              = 0x68 # 104
      CONV_I4              = 0x69 # 105
      CONV_I8              = 0x6A # 106
      CONV_R4              = 0x6B # 107
      CONV_R8              = 0x6C # 108
      CONV_U4              = 0x6D # 109
      CONV_U8              = 0x6E # 110
      CALLVIRT             = 0x6F # 111
      CPOBJ                = 0x70 # 112
      LDOBJ                = 0x71 # 113
      LDSTR                = 0x72 # 114
      NEWOBJ               = 0x73 # 115
      CASTCLASS            = 0x74 # 116
      ISINST               = 0x75 # 117
      CONV_R_UN            = 0x76 # 118
      UNBOX                = 0x79 # 121
      THROW                = 0x7A # 122
      LDFLD                = 0x7B # 123
      LDFLDA               = 0x7C # 124
      STFLD                = 0x7D # 125
      LDSFLD               = 0x7E # 126
      LDSFLDA              = 0x7F # 127
      STSFLD               = 0x80 # 128
      STOBJ                = 0x81 # 129
      CONV_OVF_I1_UN       = 0x82 # 130
      CONV_OVF_I2_UN       = 0x83 # 131
      CONV_OVF_I4_UN       = 0x84 # 132
      CONV_OVF_I8_UN       = 0x85 # 133
      CONV_OVF_U1_UN       = 0x86 # 134
      CONV_OVF_U2_UN       = 0x87 # 135
      CONV_OVF_U4_UN       = 0x88 # 136
      CONV_OVF_U8_UN       = 0x89 # 137
      CONV_OVF_I_UN        = 0x8A # 138
      CONV_OVF_U_UN        = 0x8B # 139
      BOX                  = 0x8C # 140
      NEWARR               = 0x8D # 141
      LDLEN                = 0x8E # 142
      LDELEMA              = 0x8F # 143
      LDELEM_I1            = 0x90 # 144
      LDELEM_U1            = 0x91 # 145
      LDELEM_I2            = 0x92 # 146
      LDELEM_U2            = 0x93 # 147
      LDELEM_I4            = 0x94 # 148
      LDELEM_U4            = 0x95 # 149
      LDELEM_I8            = 0x96 # 150
      LDELEM_I             = 0x97 # 151
      LDELEM_R4            = 0x98 # 152
      LDELEM_R8            = 0x99 # 153
      LDELEM_REF           = 0x9A # 154
      STELEM_I             = 0x9B # 155
      STELEM_I1            = 0x9C # 156
      STELEM_I2            = 0x9D # 157
      STELEM_I4            = 0x9E # 158
      STELEM_I8            = 0x9F # 159
      STELEM_R4            = 0xA0 # 160
      STELEM_R8            = 0xA1 # 161
      STELEM_REF           = 0xA2 # 162
      LDELEM               = 0xA3 # 163
      STELEM               = 0xA4 # 164
      UNBOX_ANY            = 0xA5 # 165
      CONV_OVF_I1          = 0xB3 # 179
      CONV_OVF_U1          = 0xB4 # 180
      CONV_OVF_I2          = 0xB5 # 181
      CONV_OVF_U2          = 0xB6 # 182
      CONV_OVF_I4          = 0xB7 # 183
      CONV_OVF_U4          = 0xB8 # 184
      CONV_OVF_I8          = 0xB9 # 185
      CONV_OVF_U8          = 0xBA # 186
      REFANYVAL            = 0xC2 # 194
      CKFINITE             = 0xC3 # 195
      MKREFANY             = 0xC6 # 198
      LDTOKEN              = 0xD0 # 208
      CONV_U2              = 0xD1 # 209
      CONV_U1              = 0xD2 # 210
      CONV_I               = 0xD3 # 211
      CONV_OVF_I           = 0xD4 # 212
      CONV_OVF_U           = 0xD5 # 213
      ADD_OVF              = 0xD6 # 214
      ADD_OVF_UN           = 0xD7 # 215
      MUL_OVF              = 0xD8 # 216
      MUL_OVF_UN           = 0xD9 # 217
      SUB_OVF              = 0xDA # 218
      SUB_OVF_UN           = 0xDB # 219
      ENDFINALLY           = 0xDC # 220
      LEAVE                = 0xDD # 221
      LEAVE_S              = 0xDE # 222
      STIND_I              = 0xDF # 223
      CONV_U               = 0xE0 # 224
      PREFIX7              = 0xF8 # 248
      PREFIX6              = 0xF9 # 249
      PREFIX5              = 0xFA # 250
      PREFIX4              = 0xFB # 251
      PREFIX3              = 0xFC # 252
      PREFIX2              = 0xFD # 253
      PREFIX1              = 0xFE # 254
      PREFIXREF            = 0xFF # 255
      ARGLIST              = 0xFE00
      CEQ                  = 0xFE01
      CGT                  = 0xFE02
      CGT_UN               = 0xFE03
      CLT                  = 0xFE04
      CLT_UN               = 0xFE05
      LDFTN                = 0xFE06
      LDVIRTFTN            = 0xFE07
      LDARG                = 0xFE09
      LDARGA               = 0xFE0A
      STARG                = 0xFE0B
      LDLOC                = 0xFE0C
      LDLOCA               = 0xFE0D
      STLOC                = 0xFE0E
      LOCALLOC             = 0xFE0F
      ENDFILTER            = 0xFE11
      UNALIGNED            = 0xFE12
      VOLATILE             = 0xFE13
      TAIL                 = 0xFE14
      INITOBJ              = 0xFE15
      CONSTRAINED          = 0xFE16
      CPBLK                = 0xFE17
      INITBLK              = 0xFE18
      RETHROW              = 0xFE1A
      SIZEOF               = 0xFE1C
      REFANYTYPE           = 0xFE1D
      READONLY             = 0xFE1E
    end

    ##
    # The CLR instruction set.
    module Instructions extend Architecture::InstructionSet
      # TODO
    end
  end

end end
