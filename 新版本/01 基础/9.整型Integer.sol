// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/* 
    int / uint : 
        - 变化的有符号或无符号整型，变量支持步长以8递增，支持从 uint8 到 uint256;
        - uint 和 int 默认是 uint256 和 int256;

        - 支持运算符:
            - 比较: <=, <, ==, !=, >=, >, 返回值是bool类型
            - 位运算符: &, |, ^异或, ~非
            - 数学运算: +, -, 一元运算+, *, /, %, **, <<, >> 右移

        - 注意: 目前solidity不支持 double/float 浮点型，如果 7/2得到的是3，不会保留，除以0会报错!
 */

 contract Math{
    // 乘
    function mul(int a, int b) pure public returns (int){
        int c = a * b;
        return c;
    }
    // 除
    function div(int a, int b)pure public returns (int){
        // The transaction has been reverted to the initial state.
        // Note: The called function should be payable if you send value and the value you send should be less than your current balance.
        // 若b为0，则报错
        int c = a / b;
        return c;
    }

    // 减
    function sub(int a, int b)pure public returns (int){
        int c = a - b;  
        return c;
    }

    // 加
    function add(int a, int b)pure public returns (int){
        return a + b;
    }

    // 取余
    function mod(int a, int b)pure public returns (int){
        return a %b;
    }

    // 次方
    function power(uint a, uint b)pure public returns (uint){
        // 次方必须是无符号的
        return a ** b;
    }

    // 比较的是十六进制
    // 与  
    function and()pure public returns(uint){
        uint a = 3; 
        uint b = 4;
        uint c = a & b;
        return c;
    }

    // 或
    function or()pure public returns(uint){
        uint a = 3; 
        uint b = 4;
        uint c = a | b;
        return c;
    }

    // 非
    function not()pure public returns(uint){
        uint a = 3; 
        uint c = ~a;
        return c;
    }

    // 异或
    function xor()pure public returns(uint){
        uint a = 3; 
        uint b = 4;
        uint c = a ^ b;
        return c;
    }

    // 位移
    // 左
    function leftShift()pure public returns (uint8){
        uint8 a = 8;
        // a << n 表示a的二进制位向左移动n位，在保证位数没有溢出的情况下等价于 a乘以2的n次方。
        uint8 c = a << 2;
        return c;
    }

    // 右
    function rightShift()pure public returns(uint){
        uint8 a = 8;
        // a >> n 表示a的二进制位向右移动n位，在保证位数没有溢出的情况下等价于 a除以2的n次方。
        uint8 c = a >> 2;
        return c;
    }
 }

// 整数字面量
// 由包含 0-9 的数字序列组成，默认被解释成十进制。在solidity中不支持八进制，前导0会被默认忽略，如0100，会被认为是100，但16进制可以这么写，如0x11
// 小数由.组成，在他的左边或右边至少要包含一个数字。如1.，.1，1.3均是有效的小数。
contract IntegerLiteral {
    function integerTest1()pure public returns(uint){
        uint8 i = (2 * 800 + 1) - 2 * 800; // 1
        return i; 
    }

    function integerTest2()pure public returns(uint){
        uint8 j = 2/4.0*10;
        return j;
    }

    function integerTest3()pure public returns(uint){
        uint8 k = 0.5 * 8;
        return k;
    }

    function integerTest4()pure public returns(uint){
        uint16 c = 
        1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111112222 
        - 
        1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111;
        return c;
    }
}