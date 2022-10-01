// SPDX-License-Identifier: MIT

// _____ ______   ___  ___  ________  ___  ________          ________  ________  ________   _________  ________  ________  ________ _________   
//|\   _ \  _   \|\  \|\  \|\   ____\|\  \|\   ____\        |\   ____\|\   __  \|\   ___  \|\___   ___\\   __  \|\   __  \|\   ____\\___   ___\ 
//\ \  \\\__\ \  \ \  \\\  \ \  \___|\ \  \ \  \___|        \ \  \___|\ \  \|\  \ \  \\ \  \|___ \  \_\ \  \|\  \ \  \|\  \ \  \___\|___ \  \_| 
// \ \  \\|__| \  \ \  \\\  \ \_____  \ \  \ \  \            \ \  \    \ \  \\\  \ \  \\ \  \   \ \  \ \ \   _  _\ \   __  \ \  \       \ \  \  
//  \ \  \    \ \  \ \  \\\  \|____|\  \ \  \ \  \____        \ \  \____\ \  \\\  \ \  \\ \  \   \ \  \ \ \  \\  \\ \  \ \  \ \  \____   \ \  \ 
//   \ \__\    \ \__\ \_______\____\_\  \ \__\ \_______\       \ \_______\ \_______\ \__\\ \__\   \ \__\ \ \__\\ _\\ \__\ \__\ \_______\  \ \__\
//    \|__|     \|__|\|_______|\_________\|__|\|_______|        \|_______|\|_______|\|__| \|__|    \|__|  \|__|\|__|\|__|\|__|\|_______|   \|__|
//                            \|_________|                                                                                                      
                                                                                                                                              
                                                                                                                                              

// @author >> @0xNicoo

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Musica is ERC1155, Ownable {
    string public name;
    string public symbol;

    mapping(uint256 => string) public songsUris;
    mapping(uint256 => bool) private uriFlags;

    constructor() ERC1155("") {
        name = "Name";
        symbol = "SIMBOL";
    }

    function uri(uint256 _id) public view override returns (string memory) {
        return songsUris[_id];
    }

    function mint(
        address _to,
        uint256 _id,
        uint256 _amount,
        string memory _uri
    ) public onlyOwner {
        require(
            uriFlags[_id] == false,
            "uri already seted for this token or token with this id already minted"
        );
        uriFlags[_id] = true;
        songsUris[_id] = _uri;
        _mint(_to, _id, _amount, "");
    }

    function withdraw() public payable onlyOwner {
        require(payable(msg.sender).send(address(this).balance));
    }
}
