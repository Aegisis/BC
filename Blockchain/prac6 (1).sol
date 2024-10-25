// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract auction {
    address public o;
    address public hba;
    uint public hb;
    bool public ae;

    constructor(){
        o = msg.sender;
        hb = 0;
        ae = false;
    }

    function bid(uint256 a) public payable {
        require(!ae, "Auction has ended!");
        require(a > hb, "Bid must be greater than current value.");
        hb = a;
        hba = msg.sender;
    }

    function endA() public {
        require(msg.sender == o, "Only owner can end.");
        ae = true;
    }

    function withdraw() public view returns (uint256){
        require(msg.sender == hba, "Only highest bidder can withdraw.");
        // payable(hba).transfer(hb);
        return hb;
    }
}






