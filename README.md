# nft-pokemon-blockchain
 Crie o seu NFT de Pokémon com Blockchain
 
# PokeDIO

PokeDIO é um contrato inteligente baseado no Ethereum para a criação e batalha de Pokémons. Este projeto utiliza o padrão ERC721 da OpenZeppelin para representar os Pokémons como NFTs.

## Instalação

1. Clone o repositório:
    ```bash
    git clone https://github.com/seu-usuario/pokedio.git
    cd pokedio
    ```

2. Instale as dependências:
    ```bash
    npm install
    ```

## Uso

### Compilar o contrato

Para compilar o contrato, use o seguinte comando:
```bash
npx hardhat compile
```

### Testar o contrato

Para executar os testes, use o seguinte comando:
```bash
npx hardhat test
```

### Implantar o contrato

Para implantar o contrato na rede Ethereum, edite o script de implantação em `scripts/deploy.js` com suas credenciais e execute:
```bash
npx hardhat run scripts/deploy.js --network <nome-da-rede>
```

## Contrato

O contrato `PokeDIO` permite a criação e batalha de Pokémons. Abaixo estão as principais funcionalidades:

### Funcionalidades

- `createNewPokemon`: Permite ao proprietário do jogo criar novos Pokémons.
- `battle`: Permite ao proprietário de um Pokémon batalhar contra outro Pokémon.

### Métodos

#### `createNewPokemon`
```solidity
function createNewPokemon(string memory _name, address _to, string memory _img) public onlyOwner
```
Cria um novo Pokémon e o minta para o endereço especificado. Somente o proprietário do contrato pode chamar este método.

#### `battle`
```solidity
function battle(uint _attackingPokemon, uint _defendingPokemon) public onlyOwnerOf(_attackingPokemon)
```
Permite ao proprietário de um Pokémon batalhar contra outro Pokémon. O nível dos Pokémons será atualizado com base no resultado da batalha.

## Contribuição

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova feature'`)
4. Faça um push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## Licença

Este projeto está licenciado sob a Licença GPL-3.0. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Contato

Para dúvidas ou sugestões, entre em contato pelo email: seu-email@dominio.com
