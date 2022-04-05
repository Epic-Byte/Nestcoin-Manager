Skip to content
Search or jump to…
Pull requests
Issues
Marketplace
Explore
 
@Godhanded 
Epic-Byte
/
Nestcoin-Manager
Public
Code
Issues
Pull requests
Actions
Projects
Wiki
Security
Insights
Settings
Nestcoin-Manager/Batchnestcoin.sol
@frankudoags
frankudoags Changed to .sol
Latest commit 57a9977 8 hours ago
 History
 1 contributor
32 lines (25 sloc)  1.11 KB
   
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.5.0/access/Ownable.sol";

contract NestToken is ERC20, Ownable {
    constructor() ERC20("NestToken", "NST") {}

    //Events for the front-end
    event SingleReward(address to, uint256 amount);
    event BatchRewards(address [] _recipients, uint256 [] _amounts);


    //Reward single customer
    function SingleRewardmint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        emit SingleReward(to, amount);
    }

    //Reward Multiple customers at once
    //Input format for the array of addresses: ["0x1234....", "0x2345...", ...]
    //Input format for the array of amounts to be distributed: ["100", "200", ...]
    function BatchRewardMint(address [] memory _recipients, uint256 [] memory _amounts ) public payable onlyOwner {

        for(uint i = 0; i< _recipients.length; ++i){
             require(_recipients[i] != address(0));
            _mint(_recipients[i], _amounts[i]);
        }
        emit BatchRewards(_recipients, _amounts);
    }
}
© 2022 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
Loading complete