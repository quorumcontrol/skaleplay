// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@skalenetwork/ima-interfaces/IMessageReceiver.sol";
import "@skalenetwork/ima-interfaces/IMessageProxy.sol";
import "./ConfigurableToken.sol";

contract SChainProxy is IMessageReceiver {
    IMessageProxy public immutable messageProxy;
    ConfigurableToken public immutable schainNFTContract;

    bytes32 public constant MAINNET_HASH =
        keccak256(abi.encodePacked("Mainnet"));
    address public immutable mainnetProxy;

    constructor(
        address _messageProxy,
        address _schainNFTContract,
        address _mainnetProxy
    ) {
        messageProxy = IMessageProxy(_messageProxy);
        schainNFTContract = ConfigurableToken(_schainNFTContract);
        mainnetProxy = _mainnetProxy;
    }

    function encodeParams(address receiver, uint256 tokenId)
        public
        pure
        returns (bytes memory data)
    {
        return abi.encodePacked(receiver, tokenId);
    }

    function decodeParams(bytes calldata data)
        internal
        pure
        returns (address receiver, uint256 tokenId)
    {
        return abi.decode(data, (address, uint256));
    }

    function sendTokenToMainnet(address receiver, uint256 tokenId)
        external
    {
        require(
            schainNFTContract.getApproved(tokenId) == address(this),
            "Not allowed ERC721 Token"
        );
        schainNFTContract.transferFrom(msg.sender, address(this), tokenId);
        schainNFTContract.burn(tokenId);
        bytes memory data = encodeParams(receiver, tokenId);
        _sendMessage("Mainnet", mainnetProxy, data);
    }

    // function that receives messages
    function postMessage(
        bytes32 schainHash,
        address sender,
        bytes calldata data
    ) external override returns (address) {
        require(schainHash == MAINNET_HASH, "Schain not allowed");
        require(sender == mainnetProxy, "incorrect sender");
        (address receiver, uint256 tokenId) = decodeParams(data);
        schainNFTContract.proxyMint(receiver, tokenId);
        return address(0);
    }

    function _sendMessage(
        string memory targetChainName,
        address targetContract,
        bytes memory data
    ) internal {
        messageProxy.postOutgoingMessage(
            keccak256(abi.encodePacked(targetChainName)),
            targetContract,
            data
        );
    }
}
