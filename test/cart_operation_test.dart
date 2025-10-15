import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/functions/cart_operations.dart';
import 'package:flutter_testing_lab/models/cart_model.dart';

void main() {
  late CartOperations cartOperation;
  setUp(() {
    cartOperation = CartOperations();
  });

  tearDown(() {
    cartOperation.clearCart();
  });
  group('Edge Cases', () {
    test('When discount is 100 %, it should return 0', () {
      //arrange
      CartItem cartItem = CartItem(
        id: 'id',
        name: 'Ipaf',
        price: 100,
        discount: 1,
      );
      //act
      cartOperation.addItem(
        cartItem.id,
        cartItem.name,
        cartItem.price,
        discount: cartItem.discount,
      );

      //assert
      expect(cartOperation.totalAmount, 0);
    });
    test('When discount is 0 %, it should return the price', () {
      //arrange
      CartItem cartItem = CartItem(
        id: 'id',
        name: 'Ipaf',
        price: 100,
        discount: 0,
      );
      //act
      cartOperation.addItem(
        cartItem.id,
        cartItem.name,
        cartItem.price,
        discount: cartItem.discount,
      );

      //assert
      expect(cartOperation.totalAmount, 100);
    });
    test('When start cart is empty, it should return 0', () {
      //assert
      expect(cartOperation.cart.length, 0);
    });
   test('when quantity is 0, it should remove the item', () {
      //arrange
      CartItem cartItem = CartItem(id: 'id', name: 'Ipaf', price: 1);
      //act
      cartOperation.addItem(cartItem.id, cartItem.name, cartItem.price);
      cartOperation.updateQuantity(cartItem.id, 0);
      //assert
      expect(cartOperation.cart.isEmpty, true);
    });
    test('When add different items with different discount', () {
      //arrange
      CartItem cartItem1 = CartItem(
        id: 'id1',
        name: 'Ipaf',
        price: 100,
        discount: 0.1,
      );
      CartItem cartItem2 = CartItem(
        id: 'id2',
        name: 'Ipaf',
        price: 100,
        discount: 0.2,
      );
      //act
      cartOperation.addItem(
        cartItem1.id,
        cartItem1.name,
        cartItem1.price,
        discount: cartItem1.discount,
      );
      cartOperation.addItem(
        cartItem2.id,
        cartItem2.name,
        cartItem2.price,
        discount: cartItem2.discount,
      );
      //assert
      expect(cartOperation.totalAmount, 170);
    });
  });

  group('cart Operation -', () {
    test(
      'When addItem is called with valid data, it should add the item to the cart',
      () {
        //arrange
        CartItem cartItem = CartItem(id: 'id', name: 'Ipaf', price: 1);
        //act
        cartOperation.addItem(cartItem.id, cartItem.name, cartItem.price);
        //assert
        expect(cartOperation.cart.first, cartItem);
      },
    );
    test('When add same item again, it should increase the quantity', () {
      //arrange
      CartItem cartItem = CartItem(id: 'id', name: 'Ipaf', price: 1);
      //act
      cartOperation.addItem(cartItem.id, cartItem.name, cartItem.price);
      cartOperation.addItem(cartItem.id, cartItem.name, cartItem.price);
      //assert
      expect(cartOperation.cart.first.quantity, 2);
    });
    test('when remove item, it should remove the item from the cart', () {
      //arrange
      CartItem cartItem = CartItem(id: 'id', name: 'Ipaf', price: 1);
      //act
      cartOperation.addItem(cartItem.id, cartItem.name, cartItem.price);
      cartOperation.removeItem(cartItem.id);
      //assert
      expect(cartOperation.cart.isEmpty, true);
    });
    test('when update quantity, it should update the quantity', () {
      //arrange
      CartItem cartItem = CartItem(id: 'id', name: 'Ipaf', price: 1);
      //act
      cartOperation.addItem(cartItem.id, cartItem.name, cartItem.price);
      cartOperation.updateQuantity(cartItem.id, 2);
      //assert
      expect(cartOperation.cart.first.quantity, 2);
    });
    test('when clear cart, it should clear the cart', () {
      //arrange
      CartItem cartItem = CartItem(id: 'id', name: 'Ipaf', price: 1);
      //act
      cartOperation.addItem(cartItem.id, cartItem.name, cartItem.price);
      cartOperation.clearCart();
      //assert
      expect(cartOperation.cart.isEmpty, true);
    });
  });
}
