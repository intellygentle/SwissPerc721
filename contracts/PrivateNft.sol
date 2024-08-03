// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @dev Sample implementation of a Private ERC721 (PERC721) contract.
 */
contract PERC721Sample is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // Mapping from token ID to owner address
    mapping(uint256 => address) private _owners;

    constructor() ERC721("Sample PERC721", "pNFT") {}

    /**
     * @dev Mints a new token.
     * @param recipient The address that will own the minted token
     */
    function mint(address recipient) public onlyOwner returns (uint256) {
        _tokenIds.increment();
        uint256 newTokenId = _tokenIds.current();
        _safeMint(recipient, newTokenId);
        return newTokenId;
    }

    /**
     * @dev Override of the `ownerOf` function to ensure privacy.
     */
    function ownerOf(uint256 tokenId) public view virtual override returns (address) {
        require(msg.sender == _owners[tokenId], "PERC721Sample: msg.sender != owner");
        return _owners[tokenId];
    }

    /**
     * @dev Override of the `balanceOf` function to ensure privacy.
     */
    function balanceOf(address owner) public view virtual override returns (uint256) {
        require(msg.sender == owner, "PERC721Sample: msg.sender != owner");
        return super.balanceOf(owner);
    }

    /**
     * @dev Override of the `getApproved` function to ensure privacy.
     */
    function getApproved(uint256 tokenId) public view virtual override returns (address) {
        require(msg.sender == _owners[tokenId], "PERC721Sample: msg.sender != owner");
        return super.getApproved(tokenId);
    }

    /**
     * @dev Override of the `isApprovedForAll` function to ensure privacy.
     */
    function isApprovedForAll(address owner, address operator) public view virtual override returns (bool) {
        require(msg.sender == operator, "PERC721Sample: msg.sender != operator");
        return super.isApprovedForAll(owner, operator);
    }

    /**
     * @dev Override _transfer to update our private _owners mapping
     */
    function _transfer(address from, address to, uint256 tokenId) internal virtual override {
        super._transfer(from, to, tokenId);
        _owners[tokenId] = to;
    }
}