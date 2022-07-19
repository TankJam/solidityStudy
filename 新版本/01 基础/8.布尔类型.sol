// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/* 
    bool: true 与 false
        !   逻辑非
        &&  逻辑与
        ||  逻辑或
        ==  等于
        !=  不等于
 */

 contract C {
    bool a = true;
    bool b = !a;  // false
    function test1() view public returns(bool){
        return a == b;  // false
    }

    function test2() view public returns(bool){
        return a != b;  // true
    }

    function test3() view public returns(bool){
        return a || b;  // true
    }

    function test4() view public returns(bool){
        return a && b;  // false
    }

 }