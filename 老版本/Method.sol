pragma solidity ^0.4.4;

/*
pragma: 声明版本
solidity: 开发语言
0.4.4: 当前合约的版本，0.4代表主版本，.4代表修复bug的升级版本
^: 代表向上兼容，0.4.4 ~ 0.4.9 可以对我们当前的代码进行编译
*/

// 方法的访问权限

contract Person{
  function age() constant returns (uint) { // 默认访问权限
    return 35;
  }

  function weight() constant public returns (uint){
    return 120;
  }

  function height() constant internal returns (uint){
    return 190;
  }

  function money() constant private returns (uint){
    return 1000000;
  }

}
