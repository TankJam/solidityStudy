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
  uint _weight;
  uint private _height;
  uint internal _age;
  uint public _money;

  // 方法不声明权限，则默认为public
  function test1() constant returns(uint){
    return _weight;
  }

  function test2() constant public returns(uint){
    return _height;
  }

  function test3() constant internal returns(uint){
    return _age;
  }

  function test4() constant private returns(uint){
    return _money;
  }

  // 通过 this. 指针的方式访问，只能访问public类型的属性与方法
  function testInternal1() constant returns(uint){
    return this.test1();
  }

  function testInternal2() constant returns(uint){
    return this.test2();
  }

}
