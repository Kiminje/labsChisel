FIRRTL version 1.2.0
circuit CombLogic :
  module CombLogic :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<1> @[cmd7.sc 2:16]
    input io_b : UInt<1> @[cmd7.sc 2:16]
    input io_c : UInt<1> @[cmd7.sc 2:16]
    output io_out : UInt<1> @[cmd7.sc 2:16]

    node _io_out_T = and(io_a, io_b) @[cmd7.sc 10:21]
    node _io_out_T_1 = eq(io_c, UInt<1>("h0")) @[cmd7.sc 10:33]
    node _io_out_T_2 = or(_io_out_T, _io_out_T_1) @[cmd7.sc 10:30]
    node _T = bits(reset, 0, 0) @[cmd7.sc 13:11]
    node _T_1 = eq(_T, UInt<1>("h0")) @[cmd7.sc 13:11]
    io_out <= _io_out_T_2 @[cmd7.sc 10:12]
    printf(clock, and(and(UInt<1>("h1"), _T_1), UInt<1>("h1")), "a: %d, b: %d, c: %d, out: %d\n", io_a, io_b, io_c, io_out) : printf @[cmd7.sc 13:11]
