// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract StringLiterals{
    string _name; // 状态变量
    // 构造函数
    constructor(){
        _name = "tank jam";
    }

    // get方法
    function name()view public returns (string memory){  // memory值传递
        return _name;  // 可以通过 length 获取字符串长度
    }

    // 字符串比较
    // 比较s1与s2是否相等
    function compareEqual(string memory s1, string memory s2) pure public returns(bool){
        // 通过转换为256去校验字符串是否相等
        return keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(s2));
    }

    // 字符串合并为一个字节数组
    function mergeS1AndS2ReturnBytes(string memory s1, string memory s2)pure public returns(bytes memory){
        // 合并字符串
        return abi.encodePacked(s1, s2);
    }

    // 字符串合并为一个字节数组，并转换为String
    function mergeS1AndS2ReturnString(string memory s1, string memory s2)pure public returns(string memory){
        return string(abi.encodePacked(s1, s2));
    }
}