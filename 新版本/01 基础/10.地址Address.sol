// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/* 
    以太坊钱包地址位数验证
        - 以太坊中地址长度为 20 字节，一字节等于8位，一共160位，所以address其实可以用 uint160 来声明;
        - 以太坊钱包地址一般是 0x开头，0x代表是十六进制，假设 F055775eBD516e7419ae486C1d50C682d4170645 进行二进制转换，它的二进制刚好160位;

 */

// 通过二进制工具转换地址
contract AddressTest{
    address _owner;
    uint160 _ownerUint;
    constructor(){
        _owner = 0xF055775eBD516e7419ae486C1d50C682d4170645;
        _ownerUint = 1372063746939811866332913075223978746532890871365;
    }

    function owner() view public returns (address){
        return _owner;
    }

    function ownerUint160() view public returns (uint160){
        return uint160(_owner);
    }

    function ownerUintToAddress() view public returns (address){
        return address(_ownerUint);
    }

    function addressToOwnerUint() view public returns (uint160){
        return uint160(_owner);
    }
}