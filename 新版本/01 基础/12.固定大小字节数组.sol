// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/* 
    固定大小字节数组可以通过 bytes1, bytes2, bytes3, ..., bytes32来进行声明。
        - bytes1只能存储一个字节，也就是二进制8位的内容。

        - bytes2只能存储两个字节，也就是二进制16位的内容。

        - bytes3只能存储三个字节，也就是二进制24位的内容。

        - bytes32能存储三十二个字节，也就是二进制32 * 8 = 256 位的内容。


    操作运算符:
        比较运算符：<=, <, ==, !=, >=, >

        位操作符：&, |, ^(异或), ~ (取反), << (左移), >> (右移)

        索引访问：如果x是一个bytesI,那么可以通过x[k](0 < k < I)获取对应索引的字节，PS：x[k]是只读，不可写。
*/


 contract C{
    bytes1 public b = 0x6c; // 0110 1100
    bytes2 public c = 0x6c69; // 0110 1100 0110 1001
    bytes3 public d = 0x6c6979; // 0110 1100 0110 1001 0111 1001
    bytes4 public e = 0x6c697975; // 0110 1100 0110 1001 0111 1001 0111 0101
    // ...
    bytes8 public f = 0x6c69797565636875; // 0110 1100 0110 1001 0111 1001 0111 0101 0110 0101 0110 0011 0110 1000 0111 0101
    bytes9 public g = 0x6c697975656368756e; // // 0110 1100 0110 1001 0111 1001 0111 0101 0110 0101 0110 0011 0110 1000 0111 0101 0110 1110

    // 1、获取字节长度，只读
    function gByteLength() view public returns(uint){
        return g.length;
    }

    // 2、不可变深度解析
    // 2.1 长度不可变
    bytes9 name = 0x6c697975656368756e;
    function setNameLength(uint length) public {
        // 修改name的leng长度
        // name.length = length;
    }

    // 2.2 内部字节不可修改
    function setNameFirstByte(bytes1 b) public {
        // TypeError: Single bytes in fixed bytes arrays cannot be modified.
        //   --> contracts/C.sol:12:9:
        // name[0] = b;
    }
 }



