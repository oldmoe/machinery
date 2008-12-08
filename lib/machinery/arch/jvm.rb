require 'machinery/arch'

module Machinery module Architecture

  ##
  # The Java Virtual Machine (JVM) architecture.
  #
  # @see http://java.sun.com/docs/books/jvms/second_edition/html/VMSpecTOC.doc.html
  module JVM extend Architecture::StackMachine

    ##
    # The JVM instruction operand types.
    module OperandTypes
      INT    = 0
      LONG   = 1
      FLOAT  = 2
      DOUBLE = 3
      OBJECT = 4
      BYTE   = 5
      CHAR   = 6
      SHORT  = 7
      VOID   = 8
    end

    ##
    # The JVM instruction opcodes.
    #
    # @see http://java.sun.com/docs/books/jvms/second_edition/html/Instructions.doc.html
    # @see http://java.sun.com/docs/books/jvms/second_edition/html/Mnemonics.doc.html
    # @see com.sun.tools.javac.jvm.ByteCodes
    module Opcodes
      NOP                  = 0x00 # 000
      ACONST_NULL          = 0x01 # 001
      ICONST_M1            = 0x02 # 002
      ICONST_0             = 0x03 # 003
      ICONST_1             = 0x04 # 004
      ICONST_2             = 0x05 # 005
      ICONST_3             = 0x06 # 006
      ICONST_4             = 0x07 # 007
      ICONST_5             = 0x08 # 008
      LCONST_0             = 0x09 # 009
      LCONST_1             = 0x0A # 010
      FCONST_0             = 0x0B # 011
      FCONST_1             = 0x0C # 012
      FCONST_2             = 0x0D # 013
      DCONST_0             = 0x0E # 014
      DCONST_1             = 0x0F # 015
      BIPUSH               = 0x10 # 016
      SIPUSH               = 0x11 # 017
      LDC1                 = 0x12 # 018
      LDC2                 = 0x13 # 019
      LDC2W                = 0x14 # 020
      ILOAD                = 0x15 # 021
      LLOAD                = 0x16 # 022
      FLOAD                = 0x17 # 023
      DLOAD                = 0x18 # 024
      ALOAD                = 0x19 # 025
      ILOAD_0              = 0x1A # 026
      ILOAD_1              = 0x1B # 027
      ILOAD_2              = 0x1C # 028
      ILOAD_3              = 0x1D # 029
      LLOAD_0              = 0x1E # 030
      LLOAD_1              = 0x1F # 031
      LLOAD_2              = 0x20 # 032
      LLOAD_3              = 0x21 # 033
      FLOAD_0              = 0x22 # 034
      FLOAD_1              = 0x23 # 035
      FLOAD_2              = 0x24 # 036
      FLOAD_3              = 0x25 # 037
      DLOAD_0              = 0x26 # 038
      DLOAD_1              = 0x27 # 039
      DLOAD_2              = 0x28 # 040
      DLOAD_3              = 0x29 # 041
      ALOAD_0              = 0x2A # 042
      ALOAD_1              = 0x2B # 043
      ALOAD_2              = 0x2C # 044
      ALOAD_3              = 0x2D # 045
      IALOAD               = 0x2E # 046
      LALOAD               = 0x2F # 047
      FALOAD               = 0x30 # 048
      DALOAD               = 0x31 # 049
      AALOAD               = 0x32 # 050
      BALOAD               = 0x33 # 051
      CALOAD               = 0x34 # 052
      SALOAD               = 0x35 # 053
      ISTORE               = 0x36 # 054
      LSTORE               = 0x37 # 055
      FSTORE               = 0x38 # 056
      DSTORE               = 0x39 # 057
      ASTORE               = 0x3A # 058
      ISTORE_0             = 0x3B # 059
      ISTORE_1             = 0x3C # 060
      ISTORE_2             = 0x3D # 061
      ISTORE_3             = 0x3E # 062
      LSTORE_0             = 0x3F # 063
      LSTORE_1             = 0x40 # 064
      LSTORE_2             = 0x41 # 065
      LSTORE_3             = 0x42 # 066
      FSTORE_0             = 0x43 # 067
      FSTORE_1             = 0x44 # 068
      FSTORE_2             = 0x45 # 069
      FSTORE_3             = 0x46 # 070
      DSTORE_0             = 0x47 # 071
      DSTORE_1             = 0x48 # 072
      DSTORE_2             = 0x49 # 073
      DSTORE_3             = 0x4A # 074
      ASTORE_0             = 0x4B # 075
      ASTORE_1             = 0x4C # 076
      ASTORE_2             = 0x4D # 077
      ASTORE_3             = 0x4E # 078
      IASTORE              = 0x4F # 079
      LASTORE              = 0x50 # 080
      FASTORE              = 0x51 # 081
      DASTORE              = 0x52 # 082
      AASTORE              = 0x53 # 083
      BASTORE              = 0x54 # 084
      CASTORE              = 0x55 # 085
      SASTORE              = 0x56 # 086
      POP                  = 0x57 # 087
      POP2                 = 0x58 # 088
      DUP                  = 0x59 # 089
      DUP_X1               = 0x5A # 090
      DUP_X2               = 0x5B # 091
      DUP2                 = 0x5C # 092
      DUP2_X1              = 0x5D # 093
      DUP2_X2              = 0x5E # 094
      SWAP                 = 0x5F # 095
      IADD                 = 0x60 # 096
      LADD                 = 0x61 # 097
      FADD                 = 0x62 # 098
      DADD                 = 0x63 # 099
      ISUB                 = 0x64 # 100
      LSUB                 = 0x65 # 101
      FSUB                 = 0x66 # 102
      DSUB                 = 0x67 # 103
      IMUL                 = 0x68 # 104
      LMUL                 = 0x69 # 105
      FMUL                 = 0x6A # 106
      DMUL                 = 0x6B # 107
      IDIV                 = 0x6C # 108
      LDIV                 = 0x6D # 109
      FDIV                 = 0x6E # 110
      DDIV                 = 0x6F # 111
      IMOD                 = 0x70 # 112
      LMOD                 = 0x71 # 113
      FMOD                 = 0x72 # 114
      DMOD                 = 0x73 # 115
      INEG                 = 0x74 # 116
      LNEG                 = 0x75 # 117
      FNEG                 = 0x76 # 118
      DNEG                 = 0x77 # 119
      ISHL                 = 0x78 # 120
      LSHL                 = 0x79 # 121
      ISHR                 = 0x7A # 122
      LSHR                 = 0x7B # 123
      IUSHR                = 0x7C # 124
      LUSHR                = 0x7D # 125
      IAND                 = 0x7E # 126
      LAND                 = 0x7F # 127
      IOR                  = 0x80 # 128
      LOR                  = 0x81 # 129
      IXOR                 = 0x82 # 130
      LXOR                 = 0x83 # 131
      IINC                 = 0x84 # 132
      I2L                  = 0x85 # 133
      I2F                  = 0x86 # 134
      I2D                  = 0x87 # 135
      L2I                  = 0x88 # 136
      L2F                  = 0x89 # 137
      L2D                  = 0x8A # 138
      F2I                  = 0x8B # 139
      F2L                  = 0x8C # 140
      F2D                  = 0x8D # 141
      D2I                  = 0x8E # 142
      D2L                  = 0x8F # 143
      D2F                  = 0x90 # 144
      INT2BYTE             = 0x91 # 145
      INT2CHAR             = 0x92 # 146
      INT2SHORT            = 0x93 # 147
      LCMP                 = 0x94 # 148
      FCMPL                = 0x95 # 149
      FCMPG                = 0x96 # 150
      DCMPL                = 0x97 # 151
      DCMPG                = 0x98 # 152
      IFEQ                 = 0x99 # 153
      IFNE                 = 0x9A # 154
      IFLT                 = 0x9B # 155
      IFGE                 = 0x9C # 156
      IFGT                 = 0x9D # 157
      IFLE                 = 0x9E # 158
      IF_ICMPEQ            = 0x9F # 159
      IF_ICMPNE            = 0xA0 # 160
      IF_ICMPLT            = 0xA1 # 161
      IF_ICMPGE            = 0xA2 # 162
      IF_ICMPGT            = 0xA3 # 163
      IF_ICMPLE            = 0xA4 # 164
      IF_ACMPEQ            = 0xA5 # 165
      IF_ACMPNE            = 0xA6 # 166
      GOTO                 = 0xA7 # 167
      JSR                  = 0xA8 # 168
      RET                  = 0xA9 # 169
      TABLESWITCH          = 0xAA # 170
      LOOKUPSWITCH         = 0xAB # 171
      IRETURN              = 0xAC # 172
      LRETURN              = 0xAD # 173
      FRETURN              = 0xAE # 174
      DRETURN              = 0xAF # 175
      ARETURN              = 0xB0 # 176
      RETURN               = 0xB1 # 177
      GETSTATIC            = 0xB2 # 178
      PUTSTATIC            = 0xB3 # 179
      GETFIELD             = 0xB4 # 180
      PUTFIELD             = 0xB5 # 181
      INVOKEVIRTUAL        = 0xB6 # 182
      INVOKESPECIAL        = 0xB7 # 183
      INVOKESTATIC         = 0xB8 # 184
      INVOKEINTERFACE      = 0xB9 # 185
      # ___UNUSED___       = 0xBA # 186
      NEW                  = 0xBB # 187
      NEWARRAY             = 0xBC # 188
      ANEWARRAY            = 0xBD # 189
      ARRAYLENGTH          = 0xBE # 190
      ATHROW               = 0xBF # 191
      CHECKCAST            = 0xC0 # 192
      INSTANCEOF           = 0xC1 # 193
      MONITORENTER         = 0xC2 # 194
      MONITOREXIT          = 0xC3 # 195
      WIDE                 = 0xC4 # 196
      MULTIANEWARRAY       = 0xC5 # 197
      IF_ACMP_NULL         = 0xC6 # 198
      IF_ACMP_NONNULL      = 0xC7 # 199
      GOTO_W               = 0xC8 # 200
      JSR_W                = 0xC9 # 201
      BREAKPOINT           = 0xCA # 202
      IMPDEP1              = 0xFE # 254
      IMPDEP2              = 0xFF # 255
    end

    ##
    # The JVM instruction set.
    module Instructions extend Architecture::InstructionSet
      # TODO
    end
  end

end end
