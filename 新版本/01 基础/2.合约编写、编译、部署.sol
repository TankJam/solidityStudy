// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld{
    function helloWorld() external pure returns (string memory){
        return "Hello, World!";
    }
}

/* 
    1.在vscode中编写好合约代码
    2.将写好的合约代码，复制到remix中，进行编译、执行;
    3.编译后可以查看字节码和ABI数据;
    4.点击deploy可以部署到VM虚拟机中执行合约;
        - JavaScript VM(London) 本地环境
            - 每次部署都会消耗gas费用
        - 生产环境中
            - 会扣除 eth 币的gas费用
 */