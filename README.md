**Platform**

[![forthebadge](https://img.shields.io/badge/node.js-339933?logo=node.js&style=for-the-badge&logoColor=white)](https://forthebadge.com)


# Capital Gains

Aplicativo para calcular o imposto a ser pago sobre lucros ou prejuízos de operações no mercado financeiro de ações.


## Instalação
Instalar as dependências do projeto

```sh
npm install 
```


## Execução


Modo desenvolvimento
```
npm run dev
```

Modo produção
```
npm run start
```

## Utilização
A aplicação recebe uma lista de operações do mercado financeiro de ações em formato json através da entrada padrão ( stdin ).

Este é um exemplo da entrada:

```ruby
[{"operation":"buy", "unit-cost":10, "quantity": 10000}, {"operation":"sell","unit-cost":20, "quantity": 5000}]
```

O programa retorna uma lista no formato json contendo o imposto pago para cada operação recebida. 

Este é um exemplo da saída:
```ruby
[{"tax":0}, {"tax":10000}]
```




## Exemplos de uso
```ruby
#case 1
Entrada:
[{"operation":"buy", "unit-cost":10, "quantity": 100},{"operation":"sell", "unit-cost":15, "quantity": 50},{"operation":"sell", "unit-cost":15, "quantity": 50}]

Saída:
[{"tax": 0},{"tax": 0},{"tax": 0}]
```

```ruby
#case 2
Entrada:
[{"operation":"buy", "unit-cost":10, "quantity": 10000},{"operation":"sell","unit-cost":20, "quantity": 5000},{"operation":"sell", "unit-cost":5, "quantity":5000}]

Saída:
[{"tax": 0},{"tax": 10000},{"tax": 0}]
```


```ruby
#case 3
Entrada:
[{"operation":"buy", "unit-cost":10, "quantity": 10000},{"operation":"sell","unit-cost":5, "quantity": 5000},{"operation":"sell", "unit-cost":20, "quantity":5000}]

Saída:
[{"tax": 0},{"tax": 0},{"tax": 5000}]
```



```ruby
#case 4
Entrada:
[{"operation":"buy", "unit-cost":10, "quantity": 10000},{"operation":"buy","unit-cost":25, "quantity": 5000},{"operation":"sell", "unit-cost":15,"quantity": 10000}]

Saída:
[{"tax": 0},{"tax": 0},{"tax": 0}]
```

```ruby
#case 5
Entrada:
[{"operation":"buy", "unit-cost":10, "quantity": 10000},{"operation":"buy","unit-cost":25, "quantity": 5000},{"operation":"sell", "unit-cost":15,"quantity": 10000},{"operation":"sell", "unit-cost":25, "quantity": 5000}]

Saída:
[{"tax": 0},{"tax": 0},{"tax": 0},{"tax": 10000}]
```


```ruby
#case 6
Entrada:
[{"operation":"buy", "unit-cost":10, "quantity": 10000},{"operation":"sell","unit-cost":2, "quantity": 5000},{"operation":"sell", "unit-cost":20, "quantity":2000},{"operation":"sell", "unit-cost":20, "quantity": 2000},{"operation":"sell","unit-cost":25, "quantity": 1000}]

Saída:
[{"tax": 0},{"tax": 0},{"tax": 0},{"tax": 0},{"tax": 3000}]
```
