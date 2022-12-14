// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";


contract Fauna1 is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    string[] faunaUrisIpfs = [
        "https://ipfs.io/ipfs/bafyreifyj3ux7nnzjqzkuhlpwsobxncpa3r2vedh7gpgohp7xakpaxirom/metadata.json",
        "https://ipfs.io/ipfs/bafyreic3sifkfu2lkt5lzkwxvelusycmfyudmxvuy3wi4om3yrksoblc5e/metadata.json",
        "https://ipfs.io/ipfs/bafyreigtvt7oigssuu3ebstodpw6svbi5gbnk7mip4pmvi6vrdvgpdewee/metadata.json"
    ];

    constructor() ERC721("Fauna1", "F1") {}

    function safeMint(address to) public {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        string memory defaultUri = faunaUrisIpfs[0];
        _setTokenURI(tokenId, defaultUri);
    }

    function _burn(uint256 tokenId)
        internal
        override(ERC721URIStorage)
    {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

     function plantTrees(uint256 tokenId, uint256 uri) public onlyOwner {
        require(uri<3, "URI too high");
        string memory newUri = faunaUrisIpfs[uri];
        _setTokenURI(tokenId, newUri);
    }

}