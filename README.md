# WAR em C

Dois programas de terminal, escritos em **C**, inspirados no jogo de tabuleiro War: um cadastro simples de territórios e uma versão com **ataques com dados** e **missões sorteadas**.

> Trabalho acadêmico de estudo de structs, ponteiros e alocação dinâmica.

## Programas

### 1. `territorios_cadastro` (nível básico)

Cadastra 5 territórios (nome, cor do exército e número de tropas) e exibe os dados.

- Conceitos: `struct`, vetor de structs, laços `for`, `scanf`/`printf`.

### 2. `war_missoes` (nível avançado)

Cadastra um número de territórios à sua escolha e simula turnos de ataque entre dois jogadores.

- Cada jogador recebe uma **missão sorteada**. Após cada ataque, o programa verifica se alguma missão foi cumprida.
- O ataque compara dois dados (1 a 6). Se o atacante vence, o território defensor muda de cor e recebe metade das tropas do atacante. Caso contrário, o atacante perde 1 tropa.
- Não é possível atacar um território da mesma cor.
- Conceitos: alocação dinâmica (`calloc`, `malloc`, `free`), ponteiros para struct, passagem por referência, `strcmp`/`strcpy`, `rand`.

## Como compilar e executar

Requisitos: `gcc` e `make` (Linux ou macOS). No Windows, use MinGW-w64 ou WSL.

```bash
make                        # compila os dois programas
./territorios_cadastro
./war_missoes
make clean                  # remove os binários
```

Sem `make`:

```bash
gcc -std=c11 -Wall -Wextra -o war_missoes src/war_missoes.c
```

## Exemplo de execução (`war_missoes`)

```text
Resultado do ataque:
Dado do Atacante (Norte): 6
Dado do Defensor (Sul): 1
Atacante venceu! Norte agora controla Sul com 5 tropas.
```

(Os dados são aleatórios, então o resultado muda a cada execução.)

## Estrutura do projeto

```text
.
├── src/
│   ├── territorios_cadastro.c   # cadastro básico
│   └── war_missoes.c            # ataques e missões
├── Makefile
└── README.md
```

## Limitações conhecidas e próximos passos

- `scanf("%s")` não limita o tamanho da leitura e pode estourar os vetores `nome[30]` e `cor[10]`. Próximo passo: usar `fgets` ou `scanf("%29s")`.
- As missões comparam cores fixas ("azul" e "vermelha") em vez da cor de cada jogador. Próximo passo: guardar a cor de cada jogador e passá-la para `verificarMissao`.
- Nomes e cores não aceitam espaços.
- Separar em `.h`/`.c` e adicionar testes automatizados para `atacar` e `verificarMissao`.
