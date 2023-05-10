// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedDistribute {
    address private immutable c0;
    address private immutable c1;
    address private immutable c2;
    address private immutable c3;
    uint256 private immutable createTime;
    uint256 private immutable amount;

    constructor(address[4] memory _contributors) payable {
        c0 = _contributors[0];
        c1 = _contributors[1];
        c2 = _contributors[2];
        c3 = _contributors[3];
        createTime = block.timestamp;
        amount = address(this).balance / 4;
    }

    function distribute() external {
        require(
            block.timestamp > createTime + 1 weeks,
            'cannot distribute yet'
        );

        payable(c0).send(amount);
        payable(c1).send(amount);
        payable(c2).send(amount);

        selfdestruct(payable(c3));
    }
}
