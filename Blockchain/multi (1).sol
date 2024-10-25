//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract college {
    string internal cname;
    string internal pname;

    function setCollege(string memory cn, string memory pn) public {
        cname = cn;
        pname = pn;
    }
}

contract student is college {
    string internal sname;
    uint internal rollno;

    function setStudent(string memory sn, uint rn) public {
        sname = sn;
        rollno = rn;
    }
}

contract exam is student {
    uint8[5] marks;
    uint per;

    function setMarks(uint8[5] memory m) public {
        marks = m;
        uint total = 0;

        for(uint i = 0; i < 5; i++) {
            total += marks[i];
        }
        
        per = total/5;
    }

    function getDetails() public view returns(string memory, string memory, string memory, uint, uint) {
        return (cname, pname, sname, rollno, per);
    }
}

contract test {
    exam e = new exam();

    function tInherit() public returns(string memory, string memory, string memory, uint, uint) {
        e.setCollege("SVU", "MCS");
        e.setStudent("Mihir", 16);
        uint8[5] memory m = [87, 99, 85, 95, 88];
        e.setMarks(m);

        return e.getDetails();
    }
}