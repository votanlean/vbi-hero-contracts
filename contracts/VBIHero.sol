//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./FakeHero.sol";

contract VBIHero is Ownable, ERC721URIStorage, FakeHero {
    using Counters for Counters.Counter;
    Counters.Counter public _tokenIds;

    mapping(string => bool) private _uriExist;

    constructor() ERC721("VBI Hero", "VBIH") {}

    function mintHero(string memory tokenURI)
        public
        onlyOwner
        returns (uint256)
    {
        require(!_uriExist[tokenURI], "URI exist");
        _uriExist[tokenURI] = true;
        _tokenIds.increment();
        uint256 newTokenId = _tokenIds.current();

        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, formatTokenUri(tokenURI));
        return newTokenId;
    }

    function getTokenCount() public view returns (uint256) {
        return _tokenIds.current();
    }
}
