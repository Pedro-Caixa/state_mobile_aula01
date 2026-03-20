# Entrega da Atividade

## Link do repositório
https://github.com/Pedro-Caixa/state_mobile_aula01

## Respostas do questionário

### 1) Qual era a estrutura do seu projeto antes da inclusão das novas telas?
Antes da adaptaçao, o projeto estava organizado para demonstrar gerenciamento de estado, com telas de contador e de lista de produtos separadas por abordagem (Provider, Riverpod e BLoC). A listagem de produtos existia, mas não em um fluxo único com tela inicial e tela de detalhes conectadas.

### 2) Como ficou o fluxo da aplicação após a implementação da navegação?
O fluxo principal ficou:

Tela Inicial -> Tela de Produtos -> Tela de Detalhes do Produto.

Na tela inicial, o usuário toca no botão para abrir a listagem. Na listagem, toca em um item para abrir os detalhes.

### 3) Qual é o papel do Navigator.push() no seu projeto?
O Navigator.push() é usado para abrir novas telas:
- da Tela Inicial para a Tela de Produtos;
- da Tela de Produtos para a Tela de Detalhes.

Ele empilha uma nova rota, mantendo a tela anterior no histórico de navegação.

### 4) Qual é o papel do Navigator.pop() no seu projeto?
O Navigator.pop() fecha a tela atual e retorna para a anterior. No projeto, ele é usado para voltar da Tela de Detalhes para a Tela de Produtos (além do botão de voltar da AppBar).

### 5) Como os dados do produto selecionado foram enviados para a tela de detalhes?
Os dados foram enviados no momento da navegação, passando o objeto Product como parâmetro no construtor da tela de detalhes dentro do Navigator.push().

### 6) Por que a tela de detalhes depende das informações da tela anterior?
Porque a tela de detalhes precisa saber exatamente qual produto foi selecionado para exibir nome, preço, descrição, imagem e outros dados. Sem esse envio, ela não teria contexto de qual item mostrar.

### 7) Quais foram as principais mudanças feitas no projeto original?
- Criação de uma Tela Inicial como ponto de entrada.
- Reorganização do fluxo para navegação entre múltiplas páginas.
- Manutenção da listagem de produtos com consumo da Fake API.
- Implementação de clique no item da lista para abrir detalhes.
- Criação da Tela de Detalhes exibindo informações completas do produto.
- Uso explícito de Navigator.push() e Navigator.pop() para controlar o fluxo.

### 8) Quais dificuldades você encontrou durante a adaptação do projeto para múltiplas telas?
As principais dificuldades foram organizar o fluxo de navegação de forma clara, garantir o envio correto dos dados do produto selecionado para a tela de detalhes e ajustar a exibição dos estados de carregamento/erro da API sem prejudicar a experiência entre as telas.
