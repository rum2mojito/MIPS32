# MIPS32
## instruction
| Mnemonic | Meaning | Type | Opcode | Funct |
|
| <code>add</code> | Add | R | 0x00 | 0x20 |
| <code>addi</code> | Add Immediate | I | 0x08 | NA |
| <code>addiu</code> | Add Unsigned Immediate | I | 0x09 | NA|
| <code>addu</code> | Add Unsigned | R | 0x00 | 0x21|
| <code>and</code> | Bitwise AND | R | 0x00 | 0x24|
| <code>andi</code> | Bitwise AND Immediate | I | 0x0C | NA|
| <code>beq</code> | Branch if Equal | I | 0x04 | NA| 
| <code>bne</code> | Branch if Not Equal | I | 0x05 | NA|
| <code>div</code> | Divide | R | 0x00 | 0x1A|
| <code>divu</code> | Unsigned Divide | R | 0x00 | 0x1B|
| <code>j</code> | Jump to Address | J | 0x02 | NA|
| <code>jal</code> | Jump and Link | J | 0x03 | NA|
| <code>jr</code> | Jump to Address in Register | R | 0x00 | 0x08|
| <code>lbu</code> | Load Byte Unsigned | I | 0x24 | NA|
| <code>lhu</code> | Load Halfword Unsigned | I | 0x25 | NA|
| <code>lui</code> | Load Upper Immediate | I | 0x0F | NA|
| <code>lw</code> | Load Word | I | 0x23 | NA|
| <code>mfhi</code> | Move from HI Register | R | 0x00 | 0x10|
| <code>mflo</code> | Move from LO Register | R | 0x00 | 0x12|
| <code>mfc0</code> | Move from Coprocessor 0 | R | 0x10 | NA|
| <code>mult</code> | Multiply | R | 0x00 | 0x18|
| <code>multu</code> | Unsigned Multiply | R | 0x00 | 0x19|
| <code>nor</code> | Bitwise NOR (NOT-OR) | R | 0x00 | 0x27|
| <code>xor</code> | Bitwise XOR (Exclusive-OR) | R | 0x00 | 0x26|
| <code>or</code> | Bitwise OR | R | 0x00 | 0x25|
| <code>ori</code> | Bitwise OR Immediate | I | 0x0D | NA|
| <code>sb</code> | Store Byte | I | 0x28 | NA|
| <code>sh</code> | Store Halfword || I | 0x29 | NA|
| <code>slt</code> | Set to 1 if Less Than | R | 0x00 | 0x2A|
| <code>slti</code> | Set to 1 if Less Than Immediate | I | 0x0A | NA|
| <code>sltiu</code> | Set to 1 if Less Than Unsigned Immediate | I | 0x0B | NA|
| <code>sltu</code> | Set to 1 if Less Than Unsigned | R | 0x00 | 0x2B|
| <code>sll</code> | Logical Shift Left | R | 0x00 | 0x00|
| <code>srl</code> | Logical Shift Right (0-extended) | R | 0x00 | 0x02|
| <code>sra</code> | Arithmetic Shift Right (sign-extended) | R | 0x00 | 0x03|
| <code>sub</code> | Subtract | R | 0x00 | 0x22|
| <code>subu</code> | Unsigned Subtract | R | 0x00 | 0x23| 
| <code>sw</code> | Store Word | I | 0x2B | NA|
