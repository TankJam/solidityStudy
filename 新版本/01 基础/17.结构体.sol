// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract Students {
    // 1.定义一个结构体类型
    struct Person{
        uint age;
        uint stuID;
        string name;
    }

    // 2.初始化结构体
    // 方式一
    Person _person = Person(18, 9527, "tank jam");

    // 方式二
    Person _person2 = Person({age:18, stuID:9527, name:"tank jam"});
    
    // 初始化memory变量
    function personInit() pure public returns (Person memory){
        Person memory _person3 = Person({age:18, stuID: 9527, name: "tank jam"});
        return _person3;
    }
}