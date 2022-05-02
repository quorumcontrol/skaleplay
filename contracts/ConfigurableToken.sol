// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
// import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


contract ConfigurableToken is ERC721Enumerable, AccessControl {
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant PROXY_ROLE = keccak256("PROXY_ROLE");
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    string public baseURI;
    
    mapping(address => bool) public projectProxy; // TODO: should this be a role?

    constructor(
        string memory _baseURI
    )
        ERC721("N", "S")
    {
        baseURI = _baseURI;
    }

    function setBaseURI(string memory _baseURI) public {
        require(hasRole(ADMIN_ROLE, msg.sender), "Must have admin role");
        baseURI = _baseURI;
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        require(_exists(_tokenId), "Token does not exist.");
        return string(abi.encodePacked(baseURI, Strings.toString(_tokenId)));
    }

    function flipProxyState(address proxyAddress) public {
        require(hasRole(ADMIN_ROLE, msg.sender), "Must have admin role");
        projectProxy[proxyAddress] = !projectProxy[proxyAddress];
    }

    function isApprovedForAll(address _owner, address operator) public view override(IERC721,ERC721) returns (bool) {
        if (projectProxy[operator]) return true;
        return super.isApprovedForAll(_owner, operator);
    }

    function proxyMint(address to, uint256 tokenId) external {
        require(hasRole(PROXY_ROLE, msg.sender), "only the proxy may mint");
        _safeMint(to, tokenId);
    }

    function burn(uint256 tokenId) external {
        require(_isApprovedOrOwner(msg.sender, tokenId), "Must be owner or approved");
        _burn(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC721Enumerable, AccessControl)
        returns (bool)
    {
        return
            interfaceId == type(IERC721).interfaceId ||
            interfaceId == type(IERC721Metadata).interfaceId ||
            interfaceId == type(IERC721Enumerable).interfaceId ||
            interfaceId == type(IAccessControl).interfaceId ||
            super.supportsInterface(interfaceId);
    }
}
