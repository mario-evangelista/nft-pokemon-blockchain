// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract PokeDIO is ERC721 {
    enum EvolutionState { None, Evolved }

    struct Pokemon {
        string name;
        uint level;
        string img;
        EvolutionState evolutionState;
    }

    Pokemon[] public pokemons;
    address public gameOwner;

    constructor() ERC721("PokeDIO", "PKD") {
        gameOwner = msg.sender;
    }

    modifier onlyOwnerOf(uint _monsterId) {
        require(
            ownerOf(_monsterId) == msg.sender,
            "Apenas o dono pode batalhar com este Pokemon"
        );
        _;
    }

    function createNewPokemon(
        string memory _name,
        address _to,
        string memory _img
    ) public {
        require(
            msg.sender == gameOwner,
            "Apenas o dono do jogo pode criar novos Pokemons"
        );
        uint id = pokemons.length;
        pokemons.push(Pokemon(_name, 1, _img, EvolutionState.None));
        _safeMint(_to, id);
    }

    function evolvePokemon(uint _pokemonId) public onlyOwnerOf(_pokemonId) {
        Pokemon storage pokemon = pokemons[_pokemonId];
        
        require(pokemon.level >= 10, "O Pokemon deve estar no nível 10 ou superior para evoluir.");
        
        // Atualiza o estado de evolução
        pokemon.evolutionState = EvolutionState.Evolved;

        // Exemplo de mudança de nome e imagem após a evolução
        if (keccak256(abi.encodePacked(pokemon.name)) == keccak256(abi.encodePacked("Pikachu"))) {
            pokemon.name = "Raichu"; // Nome após evolução
            pokemon.img = "url_da_imagem_de_raichu"; // URL da nova imagem
        } else if (keccak256(abi.encodePacked(pokemon.name)) == keccak256(abi.encodePacked("Charmander"))) {
            pokemon.name = "Charmeleon"; // Nome após evolução
            pokemon.img = "url_da_imagem_de_charmeleon"; // URL da nova imagem
        }
        // Adicione mais condições conforme necessário para outros Pokémons
    }

    function battle(
        uint _attackingPokemon,
        uint _defendingPokemon
    ) public onlyOwnerOf(_attackingPokemon) {
        Pokemon storage attacker = pokemons[_attackingPokemon];
        Pokemon storage defender = pokemons[_defendingPokemon];

        if (attacker.level >= defender.level) {
            attacker.level += 2;
            defender.level += 1;
        } else {
            attacker.level += 1;
            defender.level += 2;
        }

        // Verifica se o Pokémon atacante pode evoluir
        if (attacker.level >= 10 && attacker.evolutionState == EvolutionState.None) {
            evolvePokemon(_attackingPokemon);
        }
    }
}
