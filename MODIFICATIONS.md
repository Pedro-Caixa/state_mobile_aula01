# Documentacao das Alteracoes - Lista de Produtos
A implementacao foi feita nas tres abordagens de gerenciamento de estado do projeto:
- Provider
- Riverpod
- BLoC

## Arquivos alterados
- `lib/presentation/pages/provider_products_page.dart`
- `lib/presentation/pages/riverpod_products_page.dart`
- `lib/presentation/pages/bloc_products_page.dart`

## O que foi alterado

### 1. Contador de favoritos
Em cada pagina, foi adicionado um contador no topo:
- formato: `Favoritos: X/Total`
- `X` e calculado com base nos produtos com `favorite == true`

Isso permite visualizar rapidamente quantos itens estao favoritados.

### 2. Destaque visual dos favoritos
Cada item da lista passou a ter destaque quando esta favoritado:
- card com fundo `Colors.amber.shade50`
- nome do produto em negrito
- icone de estrela preenchida em amarelo

Com isso, os favoritos ficam visualmente diferentes dos demais itens.

### 3. Filtro "mostrar apenas favoritos"
Foi adicionado um `SwitchListTile`:
- titulo: `Mostrar apenas favoritos`
- quando ligado, a lista exibe somente itens `favorite == true`
- quando desligado, volta a exibir todos os produtos

## Por que funciona

### Fluxo de atualizacao de estado
Quando o usuario toca na estrela de um item:
1. o estado `favorite` do produto e alternado
2. o gerenciador de estado notifica mudanca
3. a UI reconstrui automaticamente
4. contador, filtro e destaque visual sao recalculados no build

### Provider
- O estado e mantido em `ProductProvider` (ChangeNotifier).
- A troca de favorito chama `notifyListeners()`.
- A tela usa `context.watch<ProductProvider>()`, entao reconstrui ao receber notificacao.

### Riverpod
- O estado e mantido em `ProductNotifier` (`StateNotifier<List<Product>>`).
- Ao alternar favorito, um novo `state` e atribuido.
- A tela usa `ref.watch(productProvider)`, entao reconstrui quando o provider atualiza.

### BLoC
- O estado e mantido em `ProductBloc` com `ProductsState`.
- O clique dispara `ToggleFavoriteEvent`.
- O BLoC emite novo estado com a lista atualizada.
- `BlocBuilder` reconstrui a UI automaticamente ao receber o novo estado.

## Detalhe importante de implementacao
Com o filtro ativo, o indice visual da lista pode ser diferente do indice real do produto na lista original.

Para evitar alternar o item errado, as telas usam `products.asMap().entries` e guardam o `originalIndex` de cada item filtrado. Assim, ao clicar na estrela, o toggle sempre altera o produto correto.

## Resultado
As tres funcionalidades obrigatorias foram atendidas:
- visualizar lista de produtos
- marcar e desmarcar favorito
- atualizacao automatica da interface

E agora tambem ha:
- contador de favoritos em tempo real
- destaque visual para favoritos
- filtro de exibicao apenas de favoritos
