//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract  prime{
    function primee(uint256 a) public  pure  returns(bool){
        for (uint256 i = 2; i < a; i++){
            if(a % i == 0){
                return false;
            }
        }
        return true;
    }
}