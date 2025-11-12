// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HaikuNFT is ERC721 {
    // Custom errors
    error HaikuNotUnique();
    error NotYourHaiku(uint256 haikuId);
    error NoHaikusShared();

    // Struct untuk menyimpan data haiku
    struct Haiku {
        address author;
        string line1;
        string line2;
        string line3;
    }

    // Array public untuk menyimpan semua haiku
    Haiku[] public haikus;

    // Mapping untuk menyimpan haiku yang dibagikan dari address ke haiku ID
    mapping(address => uint256[]) public sharedHaikus;

    // Counter untuk tracking total haiku dan sebagai ID berikutnya
    uint256 public counter = 1;

    // Mapping untuk tracking line yang sudah digunakan
    mapping(string => bool) private usedLines;

    constructor() ERC721("HaikuNFT", "HAIKU") {
        // Constructor kosong, ERC721 sudah menginisialisasi nama dan symbol
    }

    // Function untuk mint haiku baru
    function mintHaiku(
        string memory _line1,
        string memory _line2,
        string memory _line3
    ) external {
        // Cek apakah salah satu line sudah pernah digunakan
        if (
            usedLines[_line1] ||
            usedLines[_line2] ||
            usedLines[_line3]
        ) {
            revert HaikuNotUnique();
        }

        // Tandai lines sebagai sudah digunakan
        usedLines[_line1] = true;
        usedLines[_line2] = true;
        usedLines[_line3] = true;

        // Buat haiku baru
        Haiku memory newHaiku = Haiku({
            author: msg.sender,
            line1: _line1,
            line2: _line2,
            line3: _line3
        });

        // Tambahkan ke array haikus
        haikus.push(newHaiku);

        // Mint NFT dengan counter sebagai tokenId
        _mint(msg.sender, counter);

        // Increment counter untuk ID berikutnya
        counter++;
    }

    // Function untuk share haiku ke address lain
    function shareHaiku(address _to, uint256 _haikuId) public {
        // Cek apakah sender adalah owner dari haiku NFT
        if (ownerOf(_haikuId) != msg.sender) {
            revert NotYourHaiku(_haikuId);
        }

        // Tambahkan haiku ID ke shared haikus dari address tujuan
        sharedHaikus[_to].push(_haikuId);
    }

    // Function untuk mendapatkan semua haiku yang dibagikan ke caller
    function getMySharedHaikus() public view returns (Haiku[] memory) {
        uint256[] memory mySharedIds = sharedHaikus[msg.sender];
        
        // Cek apakah ada haiku yang dibagikan
        if (mySharedIds.length == 0) {
            revert NoHaikusShared();
        }

        // Buat array hasil dengan ukuran sesuai jumlah shared haikus
        Haiku[] memory result = new Haiku[](mySharedIds.length);
        
        // Loop dan ambil data haiku berdasarkan ID
        for (uint256 i = 0; i < mySharedIds.length; i++) {
            // Karena tokenId dimulai dari 1, tapi array index dari 0
            result[i] = haikus[mySharedIds[i] - 1];
        }

        return result;
    }

    // Helper function untuk mendapatkan total haiku yang sudah di-mint
    function getTotalHaikus() public view returns (uint256) {
        return haikus.length;
    }

    // Helper function untuk mendapatkan haiku berdasarkan ID
    function getHaiku(uint256 _haikuId) public view returns (Haiku memory) {
        require(_haikuId > 0 && _haikuId < counter, "Invalid haiku ID");
        return haikus[_haikuId - 1];
    }
}
