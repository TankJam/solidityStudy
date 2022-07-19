// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/* 
    一、固定大小字节数组（Fixed-size byte arrays）之间的转换
        - 固定大小字节我们可以通过bytes1 ~ bytes32来进行声明，固定大小字节数组的长度不可变，内容不可修改。接下来我们通过下面的代码看看固定大小字节之间的转换关系。

*/
contract C {
    bytes9 name9 = 0x6c697975656368756e;

    function bytes9ToBytes1() view public returns (bytes1){
        return bytes1(name9);  // bytes1: 0x6c
    }

    function bytes9ToBytes2() view public returns (bytes2){
        return bytes2(name9);
    }

    function bytes9ToBytes32() view public returns (bytes32){
        return bytes32(name9);
    }

    // 二、固定大小字节数组(Fixed-size byte arrays)转动态大小字节数组(Dynamically-sized byte array)
    function fixedSizeByteArraysToDynamicallySizedByteArray() view public returns (bytes memory){
        // 固定大小数组转为动态数组
        // Fixed -> Dynamically
        // 固定大小字节数组和动态大小字节数组之间不能简单直接转换。
        // return bytes(name9);  // 报错

        // 正确姿势
        // 1.实例化的到动态bytes对象，长度与固定大小数组一致
        bytes memory names = new bytes(name9.length);  // names.length == name9.length
        for (uint i=0; i < name9.length; i++ ){
            // 固定大小字节数组，每一个字节都依次传递给动态字节数组
            names[i] = name9[i];
        }
        return names;
    }

    // 三、固定大小字节数组不能直接转为string
    bytes9 name1 = 0x6c697975656368756e;  // 定义固定大小数组
    bytes name2 = new bytes(2);  // 定义动态大小数组

    constructor(){
        name2[0] = 0x6c;
        name2[1] = 0x69;
    }

    function nameToString() view public returns (string memory){
        // 报错
        // return string(name1);

        // 四、动态大小字节数组(Dynamically-sized byte array)转string
        return string(name2);
    }

    // 注意: 若想将固定大小数组转string，那么需要先将字节数组转为动态字节数组，再转字符串;
    // abi.encodePacked("tankjam") ---> 得到tankjam对应的bytes字节数组
    // https://tool.lu/hexstr/ 转换网站
    bytes7 b = 0x74616e6b6a616d;  // bytes1~32根据字符串的长度来定  tankjam 长度为7
    function byte32ToString() view public returns (string memory){
        // 1.初始化动态字节数组
        bytes memory names = new bytes(b.length);
        for (uint i = 0; i < b.length; i++ ){
            // 2.将固定数组转为动态数组
            names[i] = b[i];
        }
        // 3.将固定转为的动态数组，转换为动态string
        return string(names);
    }

    // 总结: string本身是一个特殊的动态字节数组，所以它只能和bytes之间进行转换，不能和固定大小字节数组进行直接转换，
    // 如果是固定字节大小数组，需要将其转换为动态字节大小数组才能进行转换。

}