// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/* 
    枚举:
        ActionChoices 就是一个自定义的整型，当枚举数不够多时，它默认的类型为uint8，当枚举数足够多时，它会自动变成uint16，
        下面的GoLeft == 0,GoRight == 1, GoStraight == 2, SitStill == 3。
        在setGoStraight方法中，我们传入的参数的值可以是0 - 3当传入的值超出这个范围时，就会中断报错。

        - 获取枚举最大值
            type(ActionChoices).max

        - 获取枚举最小值
            type(ActionChoices).min
 */

 contract Enum{
    // 设置枚举             0       1          2          3
    enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
    // 实例化枚举
    ActionChoices choice;
    // 设置默认枚举值
    ActionChoices constant defaultChoice = ActionChoices.GoStraight;

    function setGoStraight() public {
        choice = ActionChoices.GoStraight;
    }

    // 读取choice的枚举值
    function getChoice() public view returns(ActionChoices){
        return choice;
    }

    // 读取默认的枚举值
    function getDefaultChoice() public pure returns(uint){
        return uint(defaultChoice);
    }

    // 获取枚举最大值
    function getLargestValue() public pure returns(ActionChoices){

        // 注意: solidity版本必须是 0.8.8+ 才可以
        return type(ActionChoices).max;
    }

    // 获取枚举最小值
    function getSmallestValue() public pure returns(ActionChoices){
        return type(ActionChoices).min;
    }

 }