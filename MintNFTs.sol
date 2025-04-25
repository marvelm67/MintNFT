// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC721} from "@openzeppelin/contracts@5.2.0/token/ERC721/ERC721.sol";
import {ERC721Enumerable} from "@openzeppelin/contracts@5.2.0/token/ERC721/extensions/ERC721Enumerable.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts@5.2.0/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyToken is ERC721, ERC721Enumerable, ERC721URIStorage {
    uint256 private _nextTokenId;
    uint256 MAX_SUPPLY = 10000;

    constructor()
        ERC721("MyToken", "MTK")
    {}

    function safeMint(address to, string memory uri)
        public
        returns (uint256)
    {
        uint256 tokenId = _nextTokenId++;
        require(tokenId <= MAX_SUPPLY, "I'm sorry all NFT's have been minted");
        _safeMint(to, tokenId);
         (tokenId, uri);
        return tokenId;
    }

    // The following functions are overrides required by Solidity.

    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Enumerable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._increaseBalance(account, value);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
