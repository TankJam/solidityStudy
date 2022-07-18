// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/* 
    important：
        - memory 
        - storage
        - 值类型
        - 引用类型

 */

// 1、状态变量、局部变量 (函数中的本地变量)
contract Person{
    // 状态变量
    int public _age;
    string public _name;

    // 构造函数，初始化数据
    constructor(int age, string memory name){  // 默认是值类型，引用类型通过memory声明
        _age = age;
        _name = name;
    }

    function f(string memory name) pure public{
        // 将引用类型的name赋值给引用类型name1
        string memory name1 = name;
    }
}

// 2、值类型
contract Person2{
    // 状态变量
    int public _age;

    // 构造函数，初始化_age，_age属于值类型
    constructor(int age){
        _age = age;
    }

    // f函数，调用会调用 modifyAge 修改 _age 的值
    function f()view public {
        // 传递的_age是值类型，在modifyAge中无法修改_age的值
        modifyAge(_age);
    }

    // 修改函数，接收到的age是值类型，无法修改
    function modifyAge(int age) pure internal{
        // age 属于局部变量，只能在局部生效，_age保持不变
        age = 100;
    }
    
}

// 3、引用类型 memory/storage 
// 引用类型的变量有两种： memory 与 storage

// memory （值传递）
contract Person3 {
    string public _name;

    constructor(){
        _name = "tank jam";
    }

    function f() view public {
        // 将初始化的_name值类型，传递给modifyName方法
        modifyName(_name);
    }

    function modifyName(string memory name) pure internal{
        // 接收到的name参数通过memory传递参数，memory指定的参数为值传递
        string memory name1 = name;  // 值复制操作
        // 注意: name和_name分别指向不同的指针，当修改name的指针时，_name是不会发生变化的;
        // 对引用类型的字符串第一个字符修改为L
        bytes(name1)[0] = 'L';
    }
}

// storage （指针传递）
// 当函数参数为memory类型时，相当于值传递，而storage类型的函数参数将是指针传递。
contract Person4{
    string public _name;
    constructor(){
        _name = "tank jam";
    }

    function f() public {
        // 传递_name的指针给modifyName方法中的name参数
        modifyName(_name);
    }
    
    function modifyName(string storage name) internal{
        // name指向的是_name的指针
        string storage name1 = name;
        // 对指针进行字符修改操作，那么_name的值是会发生变化
        bytes(name1)[0] = 'T';  
    }
}

 