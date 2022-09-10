// =============================================================
//                         1
// =============================================================
Starting with version 0.8.4, we can use custom errors instead of previous practice of passing a 
string message as a parameter to revert()
error follows the same syntax as  event 

error CustomErrorName()
error CustomErrorName(uint25 available, uint256 required)



// =============================================================
//                         2
// =============================================================
Struct Packing
EVM stores variables and structs during runtime in storage slots of 32bytes or 256bits
While allocating slots to variables, it does so sequentially
So while forming structs or writing a bunch of variables together it is more storage efficient if 
special focus is intended on filling up earlier used slot fully if can by adjusting the next variable to the same slot

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
 Also, one should not focus on using lessbits data type. It does not do any better. 
 Sometimes using uin256 instead of uint8 helps. The reason for this is that the EVM reads 32 bytes at a time and will have to do
 some operations to make the data it is reading go down to 8 bits
 This only really applies when you are doing multiple read and writes to the same struct or storage slot in the same operation.



// =============================================================
//                         3
// =============================================================
  
 bytes16 internal constant ALPHABET = "0123456789abcdef";
 function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {
        bytes memory buffer = new bytes(2 * length + 2);
        buffer[0] = "0";
        buffer[1] = "x";
        for (uint256 i = 2 * length + 1; i > 1; --i) {
            buffer[i] = ALPHABET[value & 0xf];
            value >>= 4;
        }
        require(value == 0, "Strings: hex length insufficient");
        return string(buffer);
    }

    function addressToString(address addr) internal pure returns (string memory) {
        return toHexString(uint256(uint160(addr)), 20);
    }

// =============================================================
//                         4
// =============================================================

convert timestamp to string time
function _generateDateString(uint256 _timestamp) internal pure returns (string memory) {
        int256 z = int256(_timestamp) / 86400 + 719468;
        int256 era = (z >= 0 ? z : z - 146096) / 146097;
        int256 doe = z - era * 146097;
        int256 yoe = (doe - doe / 1460 + doe / 36524 - doe / 146096) / 365;
        int256 y = yoe + era * 400;
        int256 doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
        int256 mp = (5 * doy + 2) / 153;
        int256 d = doy - (153 * mp + 2) / 5 + 1;
        int256 m = mp + (mp < 10 ? int256(3) : -9);

        if (m <= 2) {
            y += 1;
        }

        string memory s;

        if (m < 10) {
            s = _toString(0);
        }

        s = string(abi.encodePacked(s, _toString(uint256(m)), bytes1(0x2F)));

        if (d < 10) {
            s = string(abi.encodePacked(s, bytes1(0x30)));
        }

        s = string(abi.encodePacked(s, _toString(uint256(d)), bytes1(0x2F), _toString(uint256(y))));

        return string(s);
    }








