pragma solidity ^0.4.4;

/*
pragma: 声明版本
solidity: 开发语言
0.4.4: 当前合约的版本，0.4代表主版本，.4代表修复bug的升级版本
^: 代表向上兼容，0.4.4 ~ 0.4.9 可以对我们当前的代码进行编译
*/

/*
  solidity属性的访问权限
    - pulbic  公开
    - internal
    - private
 */

// 定义一个Person合约
contract Person{
  // internal 合约属性的默认访问权限
  uint internal _age;
  uint _weight;
  uint private _height;
  uint public _money;

  function _money() constant returns (uint){
    // 当调用_money时返回290，相当于将_money的值覆盖为290;
    return 290;
  }
}
