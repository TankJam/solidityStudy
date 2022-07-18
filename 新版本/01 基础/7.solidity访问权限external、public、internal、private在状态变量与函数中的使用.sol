// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/* 
    - solidity 访问权限
        - external
        - public
        - internal
        - private

    - 状态变量:
        1.不支持 external 类型;
        2.public 类型的 _age 会自动生成一个 _age() 函数，供外部调用以便访问状态变量的值;
        3.public 类型的 _age、internal 类型的状态变量 _weight 和 private 类型的状态变量 _name 均支持合约内部函数访问;

    - 函数:
        1.external 类型的函数只支持外部访问，内部访问将报错;
        2.public 类型的函数 birthDay()、age() 均支持外部访问;
        3.public、internal、private 的类型均支持内部访问;

 */

 contract Animal{
    // 状态变量
    // 外部可以访问
    int public _age;  // 年龄

    // 内部可以访问
    string _birthDay; // 生日
    int internal _height; // 身高
    string private _name; // 姓名

    constructor() {
    // constructor() public { // 设置为抽象方法，添加public
        _age = 18;
        _height = 190;
        _name = "Tank Jam";
        _birthDay = "2000-01-01";
    }   

    // 函数
    // ---- 只允许外部可以访问，内部访问报错
    // function birthDay()view external returns (string memory){  // 若想该函数被重写，则需要添加 virtual 关键字
    function birthDay()view external virtual returns (string memory){  // 
        return _birthDay; // 返回值传递
    }

    // ---- 外部与内部都可访问
    function age() view public virtual returns (int){
        return _age;
    }

    // ---- 内部可以访问
    function height() view internal returns (int){
        return _height;
    }
    
    // ---- 内部可以访问
    // 可变类型需要通过memory或者storage来修饰
    function name() view private returns (string memory){
        return _name;
    }

    // event Log(string);
    // function test() view internal{
    //     // string memory newBirthDay = birthDay();  // external -> birthDay() 函数只支持外部访问;
    //     int newAge = age(); // public 类型函数
    //     require(newAge == 18, "ok");
    //     int newHeight = height(); // internal 类型函数
    //     require(newHeight == 190, "ok");
    //     // string memory newName = name(); // private 类型函数
    //     // emit Log(newName);
    // }
 }

 
// 状态变量继承
/* 
    1.public、internal类型的状态变量均支持继承，private类型的状态变量不支持继承;
    2.external、public、internal 类型的函数均支持继承，private类型的函数不支持继承;
 */
contract Person is Animal{
    constructor() {
        _age = 50;
        _height = 9527;
        _birthDay = "2020-01-01";
        // _name = "Tank Jam";  // private 类型变量
    }

    function test() view internal{
        int newAge = age();
        require(newAge == 18, "ok");
        int newHeight = height();
        require(newHeight == 190, "ok");
        // string memory newName = name();
    }
}


// 函数重写
/* 
    1.如果父合约希望子合约继承自己的行为，则函数声明时需要添加virtual关键字;
    2.如果子合约想要继承父合约的行为，则子合约的方法声明时需要添加 override 关键字;
    3.如果子合约重写从父合约继承的函数，则函数的行为将以子合约重写的函数为主;
 */
contract Person2 is Animal{
    // 如果子合约想继承父合约的行为（函数），那么子合约的方法（函数）声明时需添加 `override` 关键字
    function birthDay() pure external override returns (string memory){
        return "2022-01-01";
    }
    
    // 如果子合约想继承父合约的行为（函数），那么子合约的方法（函数）声明时需添加 `override` 关键字
    function age() pure public override returns (int){
        return 99;
    }
}