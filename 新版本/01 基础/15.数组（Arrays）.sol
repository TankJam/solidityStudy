// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/* 
    solidity数组:
        1.掌握arrays的可变与不可变创建
        2.深度理解可变数组与不可变数组之间的区别
        3.二维数组
        4.memory arrays 创建
        5.bytes1~bytes32、bytes、byte[]之间的对比
 */


//  一、固定长度的数组
contract C{
    // 1、固定长度类型数组的声明
    // 数组长度为5
    uint [5] T = [1, 2, 3, 4, 5];

    // 2、通过length方法遍历数组并求和
    function numbers() view public returns(uint){
        uint num = 0;
        for (uint i = 0; i < T.length; i++){
            num += T[i];
        }
        return num;
    }

    // 3、尝试修改T数组的长度
    function setTLength(uint len) public {
        // Member "length" is read-only and cannot be used to resize arrays.
        // PS: 声明数组时，一旦长度固定，将不能再修改数组的长度。
        // T.length = len;  // 报错
    }

    // 4、尝试修改T内部数据
    function setTIndex0Value()public {
        // 固定数组长度不可变，但是索引对应的值是可变的;
        // 注意: bytes0 ~ bytes32 固定字节数组中，无论是大小、长度、内容、字节均不可修改;
        T[0] = 20;
    }

    // 5、尝试通过push往
    function pushUintToT() public {
        // Member "push" not found or not visible after argument-dependent lookup in uint256[5] storage ref.
        // 固定大小的数组不能调用push方法向里面添加存储内容，声明一个固定长度的数组，比如：uint [5] T，数组里面的默认值为[0,0,0,0,0]，
        // 我们可以通过索引修改里面的值，但是不可修改数组长度以及不可通过push添加存储内容
        // T.push(6);
    }
}

// 二、可变长度的Arrays
contract C2{
    // 1、可变长度数组声明
    uint [] T = [1, 2, 3, 4, 5];
    function T_Length() view public returns (uint){
        return T.length;
    }

    // 2、通过length方法获取数组长度遍历数组求总和
    function numbers() view public returns(uint){
        uint num = 0;
        for (uint i = 0; i < T.length; i++ ){
            num += T[i];
        }
        return num;
    }

    // 3、尝试修改T数组的长度
    function setTLength(uint len)public {
        // 0.5.0以前的版本可以修改
        // Member "length" is read-only and cannot be used to resize arrays.
        // T.length = len;

    }

    // 4、尝试通过push往T数组中添加值
    function pushUintToT()public {
        T.push(6);
    }


}

// 三、二维数组（数组嵌套）
contract C3{
    // 类型[内层数组个数][外层数组个数]
    uint[2][3] T = [[1, 2], [3, 4], [5, 6]];
    function T_len() view public returns (uint){
        return T.length;
    }
    /* 
        数组T是storage类型的数组，对于storage类型的数组，数组里面可以存放任意类型的值（比如：其它数组，结构体，字典／映射等等）。
            - storage 类型数组，可以存放任意数据类型;
        对于memory类型的数组，如果它是一个public类型的函数的参数，那么它里面的内容不能是一个mapping(映射／字典)，并且它必须是一个ABI类型。
            - memory 类型数组，不能放mapping类型，并且必须是ABI类型;
     */
}

// 四、创建 Memory Arrays
contract C4{
    function f(uint len) pure public {
        // 创建一个长度为length的memory类型的数组可以通过new关键字来创建。memory数组一旦创建，它不可通过length修改其长度。
        // uint[] memory a = new uint[](7);
        // bytes memory b = new bytes(len);
        // 在这段代码中 a.length == 7 、b.length == len
        // a[0] = 8;
    }
}

// 五、数组字面量 Array Literals / 内联数组 Inline Arrays
contract C5{
    function f() pure public {

        // Invalid type for argument in function call. Invalid implicit conversion from uint8[3] memory to uint256[3] memory requested.
        // 问题1: 因为[1,2,3]未声明类型，则默认是uint8
        // g([1, 2, 3]);  
        // 解决1: 将数组中的第一个值，强转成 uint，解决默认为uint8问题
        g([uint(1), 2, 3]);

        // 问题2: memory类型的固定长度的数组不可直接赋值给storage/memory类型的可变数组
        // Type uint256[3] memory is not implicitly convertible to expected type uint256[] memory.
        // uint[] memory x = [uint(1), 2, 3];

        // Type uint256[3] memory is not implicitly convertible to expected type uint256[] storage pointer.
        // uint[] storage x = [uint(1), 2, 3];

        // 正确使用
        // uint[3] memory x = [uint(1), 2, 3];
    }

    function g(uint[3] memory _data) pure public {
        
    }
}

// 六、创建固定大小字节数组／可变大小字节数组
contract C6{
    // 创建可变字节数组的两种方式
    // bytes1 b = new bytes1(len) -> 长度不可变，内容不可修改
    // bytes1[len] b -> 长度不可变，但是内容可修改

    bytes7 a = 0x74616e6b6a616d;

    bytes1[7] aa = [bytes1(0x74), 0x61, 0x6e, 0x6b, 0x6a, 0x61, 0x6d];
    bytes1[] cc = new bytes1[](10);

    function setAIndex0Byte() public {
        // 错误，不可修改
        // Single bytes in fixed bytes arrays cannot be modified.
        // a[0] = 0x89;
    }

    function setAAIndex0Byte() public {
        // 内容可变
        aa[0] = 0x89;
    }

    function setCC() public {
        for (uint i = 0; i < a.length; i++ ){
            cc.push(a[i]);
        }
    }
    
}