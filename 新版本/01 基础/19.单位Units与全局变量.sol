// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/* 
1、Ether Units： 以太单位
    - 数字可以使用带有后缀 wei、gwei、ether 来指定以太的面额，其中没有后缀的以太数字默认为 wei。

    - 单位换算:
        1 wei = 1
        1 gwei = 10 ** 9 wei
        1 ether = 10 ** 18 wei
 */

contract C {
    /* 
    assert(1 wei == 1);
    assert(1 gwei == 1e9);
    assert(1 ether == 1e18)
     */
    
    uint a = 1 ether;
    uint b = 1 gwei;
    uint c = 10 ** 9 wei;   // 1 gwei
    uint d = 10 ** 18 wei;  // 1 ether

    function isTrueAEquleToD() view public returns (bool){
        return a == d;  // true
    }

    function isTrueBEquleToC()view public returns (bool){
        return b == c;  // true
    }

    function isTrueAEquleToB() view public returns (bool){
        return a == b;  // false
    }
}


/*
2、Time Units
    时间单位有 seconds、minutes、hours、days、weeks、years
        1 == 1seconds
        1 minutes == 60 1seconds
        1 hours = 60 minutes
        1 days == 24 hours
        1 weeks == 7 days
        1 years == 365 days
*/

contract C {
    
    // 1 == 1 seconds
    // 1 minutes == 60 seconds
    // 1 hours == 60 minutes
    // 1 days == 24 hours
    // 1 weeks == 7 days
    // 1 years == 365 days //Using "years" as a unit denomination is deprecated
    
    function test1() pure public returns (bool) {
        
        return 1 == 1 seconds; //bool: true
    }
    
    function test2() pure public returns (bool) {
        
        return 1 minutes == 60 seconds; //bool: true
    }
    
    function test3() pure public returns (bool) {
        
        return 1 hours == 60 minutes; //bool: true 
    }
    
    function test4() pure public returns (bool) {
        
        return 1 days == 24 hours; //bool: true
    }
    
    function test5() pure public returns (bool) {
        
        return 1 weeks == 7 days; //bool: true
    }
    
    // function test6() pure public returns (bool) {
        
    //     return 1 years == 365 days;
    // }
    /*
    browser/C.sol:40:16: TypeError: Using "years" as a unit denomination is deprecated.
return 1 years == 365 days;
^-----^
    */
}

/* 
3、特殊的变量和函数的函数
    有一些特殊的变量与函数存在于全局的名称空间以提供区块链相关信息。

    - 区块和交易属性
        blockhash(uint blockNumber) returns (bytes32): 当blocknumber是 256 个最近的块之一时，给定块的哈希值；否则返回零。
        block.basefee( uint): 当前区块的基本费用（EIP-3198和EIP-1559）。
        block.chainid( uint): 当前链 id。
        block.coinbase( ): 当前区块矿工地址address payable。
        block.difficulty( uint): 当前区块难度。
        block.gaslimit( uint): 当前区块的gaslimit。
        block.number( uint): 当前区块号。
        block.timestamp( uint): 当前区块时间戳，自 Unix 纪元以来的秒数。
        gasleft() returns (uint256): 剩余gas。
        msg.data( ): 完整的调用数据bytes calldata。
        msg.sender( address): 消息的发送者（当前调用）。
        msg.sig( bytes4): calldata 的前四个字节（即函数标识符）。
        msg.value( uint): 随消息发送的wei数量。
        tx.gasprice( uint): 交易的gas价格。
        tx.origin( address): 交易的发送者（完整的调用链）。

    - 错误处理
        assert(bool condition)：不满足条件，将抛出异常
        require(bool condition)：不满足条件，将抛出异常
        revert() 抛出异常

        - 在Solidity 0.4.10版本之前使用throw来处理异常，0.4.10之后，我们通常如下使用：
            if(msg.sender != owner) { revert(); }
            assert(msg.sender == owner);
            require(msg.sender == owner);
 */


 /* 
4、字节成员函数
    - bytes.concat(...) returns (bytes memory): 将可变数量的字节和 bytes1, ..., bytes32 参数连接到一个字节数组
  */


/* 
5、数学和密码函数
    - addmod(uint x, uint y, uint k) returns (uint)
        - 计算以任意精度执行加法的位置，并且不会再 处回绕，断言从0.5.0版本开始
    - mulmod(uint x, uint y, uint k) returns (uint)
        - 计算以任意精度执行乘法并且不会再 处回绕，断言从 0.5.0 版本开始。(x * y) % k``2**256``k != 0
    - 计算输入的 Keccak-256 哈希
        - keccak256(bytes memory) returns(bytes32)
 */