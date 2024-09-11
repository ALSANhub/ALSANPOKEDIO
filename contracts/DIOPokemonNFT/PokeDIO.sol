// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract PokeDIO is ERC721 {

    struct Pokemon {
        string name;
        uint level;
        string img;
    }

    Pokemon[] public pokemons;
    address public gameOwner;

    constructor() ERC721 ("PokeDIO", "PKD") {
        gameOwner = msg.sender;
    }

    modifier onlyOwner(uint _monsterID) {
        require(ownerOf(_monsterID) == msg.sender, "Apenas o dono pode batalhar com este Pokemon.");
    _;
    }

    function battle(uint _attackingPokemon, uint _defendingPokemon) public onlyOwner(_attackingPokemon) {
        Pokemon storage attacker = pokemons[_attackingPokemon];
        Pokemon storage defender = pokemons[_defendingPokemon];

        if (attacker.level >= defender.level) {
            attacker.level += 2;
            defender.level += 1;
        }else{
            attacker.level += 1;
            defender.level += 2;
        }
    
    }

    function createPokemon(string memory _name, uint _level, address _to, string memory _img) public {
        require(msg.sender == gameOwner, "Apenas o dono do jogo pode criar novos Pokemons"); 
        uint id = pokemons.length;
        pokemons.push(Pokemon( _name,  _level, _img ));
        _safeMint(_to, id);
    }

}
