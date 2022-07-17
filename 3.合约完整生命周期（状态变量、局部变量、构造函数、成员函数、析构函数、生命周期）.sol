// SPDX-License-Identifier: GPL-3.0
// 1.MIT内容与三条款BSD许可证（3-clause BSD license）内容颇为近似，但是赋予软件被授权人更大的权利与更少的限制
pragma solidity >=0.7.0 <0.9.0;
// 2.pragma solidity代表solidity版本声明，>=0.7.0 <0.9.0 表示当前合约版本>=0.7.0且<0.9.0。
// 在remix中调试，需要在COMPILER中切换到复合范围的合约编译器版本


/* 
    1、什么是智能合约
        - 在区块链上运行的程序称之为智能合约（smart contract）;
*/

// 3.合约声明（合约即类）
contract Counter{  

    // 4.状态变量
    uint count = 0;
    address payable owner;

    // 5.构造函数 (初始化数据)
    // PS: 老版本是与 function 合约名
    constructor(){  // 注意：构造函数无需添加 public可见性，如果添加会报错
    owner = payable(msg.sender);
    }

    // 6.成员函数（即方法）
    function increment() public {
        // 7.本地变量（函数的局部变量）
        uint step = 10;
        count = count + step;
    }
    // 成员函数
    function getCount() view public returns(uint){
        return count;
    }
    // 当调用kill函数时，就会调用析构函数销毁数据
    function kill() public {
        if (owner == payable(msg.sender)){
            // 8.析构函数(销毁数据)
            selfdestruct(owner);
        }
    }
}