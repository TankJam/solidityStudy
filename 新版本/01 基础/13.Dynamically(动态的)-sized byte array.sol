// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/* 
1、Dynamically-sized byte array
    string 是一个动态尺寸的 UTF-8 编码字符串，它其实是一个特殊的可变字节数组，string是引用类型，而非值类型;
    bytes 动态字节数组，引用类型;

2、常规字符串string转换为bytes
    string字符串中没有提供length方法获取字符串长度，也没有提供方法修改某个索引的字节码，
    不过可以将string转为bytes，然后调用length获取字节长度，并修改某个索引的字节码;

    总结: 
        - 不可变字节数组
            - 确定字节数据大小，可以通过bytes1~32精确控制数据大小，能够降低存储成本;

        - 可变字节数组
            - 不确字节数据大小的情况下，可以使用string或者bytes;
            - 可以通过 bytes name = new bytes(length), 声明可变大小和可修改的字节内容的可变字节数组;
 */

 contract C{
    bytes9 public g = 0x6c697975656368756e;
    // string public name = "tank jam";

    // 3、汉字字符串或特殊字符的字符串转为bytes
    // 3.1 特殊字符
    // string public name = "a!+&520";

    // 3.2 中文字符
    // string public name = "坦克张";  0.7.0 以前是支持中文

    // 3.3 bytes字节数组
    bytes public name = new bytes(1);

    // 往字节数组中添加字节
    function pushOneByte(bytes1 b) public {
        name.push() = b; // 往数组里面添加一个字节，name.push(b) 等价于 name.push() = b；
    }

    // 删除一个字节数组中的一个字节
    function popOneByte() public {
        name.pop(); 
    }

    // 修改字节数组中某个索引对应的字节
    function setIndexByte(uint index, bytes1 b) public {
        name[index] = b;
    }

    // 清空字节数组
    function deleteByte()public {
        delete name;
    }

    function gByteLength() view public returns (uint){
        return g.length;
    }

    // nameBytes这个函数的功能是将字符串name转换为bytes，并且返回的结果为0x6c697975656368756e
    function nameBytes() view public returns (bytes memory){
        return bytes(name);
    }

    // string字符串它并不提供length方法帮助我们返回字符串的长度，所以在nameLength方法中，我们将name转换为bytes，
    // 然后再调用length方法来返回字节数，因为一个字节对应一个英文字母，所以返回的字节数量刚好等于字符串的长度
    function nameLength() view public returns (uint){
        return bytes(name).length;
    }

    // name字符串中的某个字母进行修改，那么我们直接通过x[k] = z的形式进行修改即可。x是bytes类型的字节数组，k是索引，z是bytes1类型的变量值。
    function setNameFirstByteForL(bytes1 z) public {
        // 修改字符串
        bytes(name)[0] = z;
    }
 }

 