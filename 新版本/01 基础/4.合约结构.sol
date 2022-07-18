// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// 1、状态变量 State Variables
// 状态变量是其值永久存储在合约实例中的变量

// 2、函数 Functions
// 函数时合约实例对象的一种行为，可以通过合约实例调用函数请求其帮助我们完成期望的某个任务;

// 3、函数修饰符 Modifier
// 函数修饰符可以用于声明方式修改功能的语义。Modifier修饰符不支持重载，也就是相同的函数名不能出现两个;
contract Purchase{
    address public seller;
    // modifier 修饰符表示 onlySeller 函数不可重载
    modifier onlySeller(){ 
        require(
            msg.sender == seller,
            "Only seller can call this."
        );
        _;
    }
}

// 4、事件 Events
// 事件是EVM日志记录工具的便捷接口
contract SimpleAuction{
    event HighestBidIncreased(address bidder, uint amount);  // 定义 Event
    function bid() public payable{
        emit HighestBidIncreased(msg.sender, msg.value);  // 触发 Event
    }
}


// 5、结构体 Struct Types
// 结构体是自定义的结构类型，可以对多个变量进行分组封装;
contract Ballot{
    struct Voter { // Struct
        uint weight;
        bool voted;
        address delegate;
        uint vote;
    }
}

// 6、枚举 Enum Types
// 枚举可用于创建带有限“常量值”集的自定义类型;
contract Purchase2{
    enum State { Created, Locked, Inactive} // Enum
}

// 7、库 library
struct Data{
    mapping(uint => bool) flags;
}

// 集合 Set library
library Set {
    function insert(Data storage self, uint value) public returns(bool){
        // 神马写法？
        if (self.flags[value]) 
            return false;
        self.flags[value] = true;
        return true;
    }

    function remove(Data storage self, uint value) public returns (bool){
        if (!self.flags[value])
            return false;
        self.flags[value] = false;
        return true;
    }

    function contains(Data storage self, uint value) public view returns (bool){
        return self.flags[value];
    }

}

contract C {
    Data knownValues;
    function register(uint value) public {
        // library 函数不需要通过实例对象调用，可以直接通过library名字直接调用
        require(Set.insert(knownValues, value));
    }
}

// 8、接口 Interfaces
/* 
    接口类似于抽象类，但不能实现任何功能，而且还有其他限制:
        - 接口不能继承其他合约，但可以从其他接口继承;
        - 所有声明的函数都必须是外部的;
        - 接口不能声明构造函数;
        - 接口不能声明状态变量;
 */

interface ParentA {
    function test() external returns(uint256);
}

interface ParentB {
    function test() external returns (uint256);
}