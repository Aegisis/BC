//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract  factorial{
    function fact(uint256 a) public  pure  returns(uint256){
        uint256 ans = 1;
        for (uint256 i = 2; i <= a; i++){
            ans = ans * i;
        }
        return ans;
    }
}