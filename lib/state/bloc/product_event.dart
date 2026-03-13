abstract class ProductEvent {}

class ToggleFavoriteEvent extends ProductEvent {
  final int index;
  ToggleFavoriteEvent(this.index);
}
