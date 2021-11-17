//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "base64-sol/base64.sol";

contract FakeHero {
    function _svgToImageUri(string memory svg)
        private
        pure
        returns (string memory)
    {
        string memory baseUrl = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );
        return string(abi.encodePacked(baseUrl, svgBase64Encoded));
    }

    function formatTokenUri(string memory description)
        public
        pure
        returns (string memory)
    {
        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                "{'name':'",
                                "VBI Hero NFT",
                                "', 'description':'",
                                description,
                                "', 'attributes':'attacker hero', 'image':'https://lorempokemon.fakerapi.it/pokemon'}"
                            )
                        )
                    )
                )
            );
    }
}
