// SPDX-License-Identifier: AGPL-3.0
pragma solidity 0.8.15;

import 'hardhat/console.sol';

contract Security101 {
    mapping(address => uint256) balances;

    function deposit() external payable {}

    function withdraw(uint256 amount) external {}
}

contract OptimizedAttackerSecurity101 {
    Security101 public security;

    constructor(address _security) payable {
        security = Security101(_security);
        security.deposit{value: 1 ether}();
    }

    receive() external payable {
        // uint256 amount = address(this).balance;
        // uint256 remaining = address(security).balance;
        // if (remaining > 0) {
        //     if (amount > remaining) {
        //         amount = remaining;
        //     }
        //     security.deposit{value: amount}();
        //     security.withdraw(amount);
        // }
    }
}
