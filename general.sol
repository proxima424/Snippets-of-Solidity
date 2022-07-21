// =============================================================
//                         1
// =============================================================
// Starting with version 0.8.4, we can use custom errors instead of previous practice of passing a 
// string message as a parameter to revert()
// error follows the same syntax as  event 
error CustomErrorName()
error CustomErrorName(uint25 available, uint256 required)



// =============================================================
//                         2
// =============================================================
// Struct Packing
// EVM stores variables and structs during runtime in storage slots of 32bytes or 256bits
// While allocating slots to variables, it does so sequentially
// So while forming structs or writing a bunch of variables together it is more storage efficient if 
// special focus is intended on filling up earlier used slot fully if can by adjusting the next variable to the same slot
struct space {
    uint128 a
    uint256 b        // this struct is allocated three slots 
    uint128 c
}

struct space {
    uint128 a       // this struct is allocated two slots 
    uint128 c       // because both a and c are alloted the same slot to fill up the 256bit slot     
    uint256 b
}
// Also, one should not focus on using lessbits data type. It does not do any better. 
// Sometimes using uin256 instead of uint8 helps. The reason for this is that the EVM reads 32 bytes at a time and will have to do
// some operations to make the data it is reading go down to 8 bits
// This only really applies when you are doing multiple read and writes to the same struct or storage slot in the same operation.



// =============================================================
//                         3
// =============================================================





