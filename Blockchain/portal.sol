// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract studentC{
    struct std{
        uint sid;
        string name;
        address addr;
        uint BCT;
        uint ML;
        uint BDA;
        uint percent;
        string grade;
        string uid;
    }


    mapping(uint256 => std) public student;
    function register(uint i, string memory n, uint b, uint m, uint a) public {
        student[i].name = n;
        student[i].addr = msg.sender;
        student[i].sid = i;
        student[i].BCT = b;
        student[i].ML = m;
        student[i].BDA = a;

        uint p = ((b + m + a) * 100) / 300;
        student[i].percent = p;

        if(p >= 80){
            student[i].grade = "O";
        }
        else if(p >= 60 && p < 80){
            student[i].grade = "A";
        }
        else if(p >= 40 && p < 60){
            student[i].grade = "B";
        }
        else{
            student[i].grade = "F";
        }

        // Remove vowels from the name
        string memory nameWithoutVowels = removeVowels(n);
        
        // Convert idNo to string
        string memory idNoStr = uintToString(i);
        
        // Concatenate nameWithoutVowels and idNoStr
        student[i].uid = string(abi.encodePacked(nameWithoutVowels, idNoStr));
    }


    function removeVowels(string memory str) internal pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(strBytes.length);
        uint j = 0;
        for (uint i = 0; i < strBytes.length; i++) {
            if (
                strBytes[i] != 'a' && strBytes[i] != 'e' && strBytes[i] != 'i' && 
                strBytes[i] != 'o' && strBytes[i] != 'u' &&
                strBytes[i] != 'A' && strBytes[i] != 'E' && strBytes[i] != 'I' && 
                strBytes[i] != 'O' && strBytes[i] != 'U'
            ) {
                result[j] = strBytes[i];
                j++;
            }
        }
        bytes memory trimmedResult = new bytes(j);
        for (uint k = 0; k < j; k++) {
            trimmedResult[k] = result[k];
        }
        return string(trimmedResult);
    }


    function uintToString(uint v) internal pure returns (string memory) {
        if (v == 0) {
            return "0";
        }
        uint maxLength = 100;
        bytes memory reversed = new bytes(maxLength);
        uint i = 0;
        while (v != 0) {
            uint remainder = v % 10;
            v = v / 10;
            reversed[i++] = bytes1(uint8(48 + remainder));
        }
        bytes memory s = new bytes(i);
        for (uint j = 0; j < i; j++) {
            s[j] = reversed[i - j - 1];
        }
        return string(s);
    }
}