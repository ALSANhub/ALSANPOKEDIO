---

# PokeDIO - NFT Pokémon Battle Game 🐉

PokeDIO é um jogo baseado em NFTs onde os jogadores podem criar, colecionar e batalhar com seus próprios Pokémons. Cada Pokémon é representado por um NFT único que possui atributos como nome, nível e uma imagem associada. O jogo é implementado em Solidity utilizando o padrão ERC721.

---

## 📋 Funcionalidades

- **Criação de Pokémons**: O dono do jogo pode criar novos Pokémons, que são mintados como NFTs e atribuídos a diferentes endereços.
- **Batalhas**: Somente o dono de um Pokémon pode iniciar uma batalha entre dois Pokémons. O resultado da batalha atualiza os níveis dos Pokémons envolvidos.
- **ERC721 Compliance**: Cada Pokémon é um token NFT conforme o padrão ERC721 da OpenZeppelin.

---

## 🛠️ Contrato

### Estrutura de Dados:

- **Pokémon**: Cada Pokémon possui os seguintes atributos:
  - `name`: Nome do Pokémon.
  - `level`: Nível atual do Pokémon.
  - `img`: URL ou hash de imagem do Pokémon.

### Principais Variáveis:

- `pokemons`: Armazena a lista de todos os Pokémons criados no jogo.
- `gameOwner`: Define o endereço que é o dono do jogo e pode criar novos Pokémons.

---

## 🚀 Como Funciona

### Criação de Pokémons
Apenas o dono do contrato (quem o implementou) pode criar novos Pokémons.

```solidity
function createPokemon(string memory _name, uint _level, address _to, string memory _img) public;
```

- **Parâmetros:**
  - `_name`: O nome do Pokémon.
  - `_level`: O nível inicial do Pokémon.
  - `_to`: O endereço que receberá o NFT do Pokémon.
  - `_img`: URL da imagem do Pokémon.

- **Regras**:
  - Apenas o dono do contrato (`gameOwner`) pode chamar essa função.

### Batalha entre Pokémons
Os jogadores podem batalhar seus Pokémons com outros.

```solidity
function battle(uint _attackingPokemon, uint _defendingPokemon) public;
```

- **Parâmetros:**
  - `_attackingPokemon`: ID do Pokémon atacante.
  - `_defendingPokemon`: ID do Pokémon defensor.

- **Regras**:
  - Apenas o dono do Pokémon atacante pode iniciar a batalha.
  - O nível dos Pokémons é atualizado após a batalha:
    - Se o nível do atacante for maior ou igual ao do defensor, o atacante ganha 2 níveis, e o defensor 1 nível.
    - Se o nível do defensor for maior, o defensor ganha 2 níveis, e o atacante 1 nível.

---

## 🧑‍💻 Instalação e Configuração

### Pré-requisitos:
- **Node.js** e **npm**: Certifique-se de ter o Node.js e npm instalados.
- **Solidity**: O contrato foi escrito na versão ^0.8.26.


Interaja com o contrato usando o Ethers.js ou outro framework.

---

## 🔥 Exemplo de Uso

1. **Criação de um Pokémon:**
   ```solidity
   createPokemon("Pikachu", 10, 0x123..., "https://example.com/pikachu.png");
   ```

2. **Batalha entre Pokémons:**
   ```solidity
   battle(0, 1);
   ```

---

## 🛡️ Segurança

- Certifique-se de verificar a propriedade dos Pokémons antes de iniciar uma batalha usando o modificador `onlyOwner`.
- Somente o `gameOwner` pode criar novos Pokémons, evitando a criação descontrolada.

---

## 📝 Licença

Este projeto é licenciado sob a licença **GPL-3.0**. Veja o arquivo [LICENSE](./LICENSE) para mais detalhes.

---

## 🌐 Endereço do Contrato

O contrato foi implementado no endereço:

**0x04fC07B8fb7aa00ed8C6Efb4fAcb92c607F3F9B6** na Ethereum.

---

## 🛠️ Tecnologias Utilizadas

- **Solidity**
- **ERC721 (OpenZeppelin)**
- **Ganache**
- **Ethers.js**

---

## 🤝 Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma issue ou enviar um pull request.

---

## 📞 Contato

Se tiver dúvidas ou sugestões, entre em contato com [seu-email@exemplo.com](mailto:).

---

