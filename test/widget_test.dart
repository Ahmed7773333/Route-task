import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:route_task/features/Home%20Layout/data/models/products_model.dart';
import 'package:route_task/features/Home%20Layout/presentation/pages/details_page.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('ProductDetails Widget Tests', () {
    Products testProduct = Products(
      id: 1,
      title: 'Test Product',
      description: 'This is a test product.',
      price: 100,
      discountPercentage: 10,
      rating: 4.5,
      stock: 20,
      tags: ['tag1', 'tag2'],
      brand: 'Test Brand',
      sku: '12345',
      weight: 1.0,
      dimensions: Dimensions(width: 10, height: 20, depth: 5),
      warrantyInformation: '1 year warranty',
      shippingInformation: 'Ships in 2-3 days',
      availabilityStatus: 'In Stock',
      reviews: [
        Reviews(
          rating: 5,
          comment: 'Great product!',
          date: '2023-07-14',
          reviewerName: 'John Doe',
          reviewerEmail: 'john.doe@example.com',
        ),
      ],
      returnPolicy: '30 days return policy',
      minimumOrderQuantity: 1,
      meta: Meta(
        createdAt: '2023-07-01',
        updatedAt: '2023-07-10',
        barcode: '1234567890123',
        qrCode: 'QR123456',
      ),
      images: ['https://example.com/image.jpg'],
      thumbnail: 'https://example.com/thumbnail.jpg',
    );

    testWidgets('ProductDetails renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ProductDetails(testProduct),
      ));

      // Verify the title
      expect(find.text('Test Product'), findsOneWidget);

      // Verify the price
      expect(find.text('EGP 100'), findsOneWidget);

      // Verify the rating
      expect(find.text('4.5 (4.5)'), findsOneWidget);

      // Verify the description
      expect(find.text('This is a test product.'), findsOneWidget);

      // Verify the reviews section
      expect(find.text('Great product!'), findsOneWidget);
    });

    testWidgets('ProductDetails handles missing thumbnail gracefully',
        (WidgetTester tester) async {
      testProduct.thumbnail = null;

      await tester.pumpWidget(MaterialApp(
        home: ProductDetails(testProduct),
      ));

      // Verify that the default thumbnail is shown or handled
      expect(find.byType(NetworkImage), findsNothing);
    });

    testWidgets('Navigates to ProductDetails on tap',
        (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: ProductDetails(testProduct),
        navigatorObservers: [mockObserver],
      ));

      await tester.tap(find.byType(InkWell).first);
      await tester.pumpAndSettle();

      verify(mockObserver.didPush(
          MaterialPageRoute(builder: (c) => ProductDetails(testProduct)), any));
    });
  });
}
