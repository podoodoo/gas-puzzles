// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedArraySort {
    function sortArray(
        uint256[] memory data
    ) external pure returns (uint256[] memory) {
        uint256 dataLen = data.length;

        // Create 'working' copy
        // uint[] memory _data = new uint256[](dataLen);
        // for (uint256 k = 0; k < dataLen; ) {
        //     _data[k] = data[k];
        //     unchecked {
        //         k++;
        //     }
        // }

        uint256 i = dataLen - 1;
        while (i > 0) {
            uint256 j;
            while (j < i) {
                if (data[i] < data[j]) {
                    uint256 temp = data[i];
                    data[i] = data[j];
                    data[j] = temp;
                }
                unchecked {
                    j += 1;
                }
            }
            unchecked {
                i -= 1;
            }
        }
        return data;
    }
}
