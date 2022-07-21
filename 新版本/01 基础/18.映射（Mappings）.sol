// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
import "hardhat/console.sol"; // 遗留问题，该如何导入

/* 
    语法: 
        - mapping(_KeyType => _ValueType)
        - {age: 28, height: 172, name: tank jam, wx: tank9527}
*/

contract MappingExample{
    // 测试账号
    // 0xca35b7d915458ef540ade6068dfe2f44e8fa733c
    
    // 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c
    
    // 0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db

    // 定义一个 key为address类型，value为uint类型的mapping
    mapping(address => uint) balances;
    
    function update(address a, uint newBalance) public {
        balances[a] = newBalance;
    }

    /* 
        mkdir hardhat-tutorial 
        cd hardhat-tutorial 
        npm init --yes 
        npm install --save-dev hardhat
     */
    // {0xca35b7d915458ef540ade6068dfe2f44e8fa733c: 100,0x14723a09acff6d2a60dcdf7aa4aff308fddc160c: 200,0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db: 300 }
    function searchBalance(address a) view public returns (uint){
        return balances[a];
    }
}

contract MappingExample2{
    mapping(address => uint) public balances;
    
    function update(uint newBalance) public {
        console.log(msg.sender);
        console.log(newBalance);
        balances[msg.sender] = newBalance;
    }

    // {0xca35b7d915458ef540ade6068dfe2f44e8fa733c: 100,0x14723a09acff6d2a60dcdf7aa4aff308fddc160c: 200,0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db: 300 }
    function searchBalance(address a) view public returns (uint){
        return balances[a];
    }
}


contract MappingUser{
    function f() public returns (uint){
        MappingExample2 m = new MappingExample2();
        m.update(100);
        console.log(m.balances(msg.sender));
        console.log(msg.sender);
        console.log(address(this));
        console.log(m.balances(address(this)));
        return m.balances(address(this));
    }
}


// 结构体和字典综合案例
/* 
    1.定义一个包含两个属性的结构体
        - Funder 资助者
        - addr 资助者地址
        - amount 资助者金额
 */

struct Funder{
    address addr;
    uint amount;
}

// 2.定义一个众筹合约
contract CrowdFunding{
    // 定义一个合约内部结构体
    struct Campaign {  // 活动
        address payable beneficiary;  // 收款地址
        uint fundingGool; // 目标金额
        uint numFunders;  // 资助者数量
        uint amount;  // 当前已众筹金额
        mapping(uint => Funder) funders;  // 资助表单
    }

    uint numCamaigns;  // 活动id
    mapping (uint => Campaign) campaigns;  // 活动索引表

    function newCampaign(address payable beneficiary, uint goal) public returns (uint campaignID){
        campaignID = numCamaigns++; // compaignID 是返回的变量
        Campaign storage c = campaigns[campaignID];

        // 我们不能使用 "campaigns[campaignID] = Campaign(beneficiary, goal, 0, 0)",因为右侧创建了一个包含映射的内存结构“Campaign”。
        c.beneficiary = beneficiary;
        c.fundingGool = goal;
    }    

    function contribute(uint campaignID) public payable {
        Campaign storage c = campaigns[campaignID];
        // 或者使用Funder(msg.sender, msg.value) 初始化
        c.funders[c.numFunders++] = Funder({ addr: msg.sender, amount: msg.value });
        c.amount += msg.value;
    }

    function checkGoalReached(uint campaignID) public returns (bool reached){
        Campaign storage c = campaigns[campaignID];
        if (c.amount < c.fundingGool)  // 未达到目标金额，返回false
            return false;
        uint amount = c.amount;
        c.amount = 0;
        c.beneficiary.transfer(amount);  // 转账到相应活动首款的地址
        return true;
    }
}
