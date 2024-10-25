//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract employee{
    string n;
    uint mid;
    uint sal;
    function setE(string memory a, uint b, uint c) public {
        n = a;
        mid = b;
        sal = c;
    }
}

contract department{
    string dep;
    function setD(string memory a) public {
        dep = a;
    }
}

contract salary is employee, department{
    uint HRA;
    function calHRA() public returns(uint){
        HRA = (sal * 20) / 100;
        return HRA;
    }

    function getVal() public view returns (string memory, uint, uint, string memory, uint){
        return (n, mid, sal, dep, HRA);
    }
}

contract test{
    salary s = new salary();
    function tInherit() public returns(string memory, uint, uint, string memory, uint){
        s.setE("Mihir Nagda", 101, 15000);
        s.setD("CS");
        s.calHRA();
        return s.getVal();
    }
}