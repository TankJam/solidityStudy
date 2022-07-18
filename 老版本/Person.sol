// contract Person 类
contract Person {
  uint _height; // 身高
  uint _age; // 年龄
  address _owner;  // 合约持有者

  // 方法名和合约名相同时就属于构造函数，在创建对象时，构造函数会先调用执行
  function Person(){
    _height = 180;
    _age = 29;
    _owner = msg.sender;
  }

  // 返回合约地址
  function owner() constant returns(address){
    return _owner;
  }

  // set方法，修改height属性
  function setHeight(uint height){
    _height = height;
  }

  // get方法，读取height信息（不需要gas费）。constant 代表只读
  function height() constant returns (uint){  // returns 返回值
    return _height;
  }

  function setAge(uint age){
    _age = age;
  }

  function age() constant returns (uint){
    return _age;
  }

  // kill方法，对象销毁
  function kill(){
    // selfdestruct(msg.sender);  selfdestruct(合约地址) 销毁当前合约地址
    if (_owner == msg.sender){
      selfdestruct(_owner);
    }
    // 合约地址：0xbe752ae2cc9f13c71ce5c1cafd28573f01a2d5b8737df68bf7d78e907684d83b

  }

}
