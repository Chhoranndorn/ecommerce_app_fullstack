import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// --- MOCK DATA ---
// Replace this with your actual product data from your controller or API.
final Map<String, dynamic> productData = {
  'name': 'នំបញ្ចុកសម្លខ្មែរ ញាំ',
  'price': 3.00,
  'description': 'នំបញ្ចុកសម្លខ្មែរ ពីធម្មជាតិពិតៗដែលមានរសជាតិឆ្ងាញ់',
  'image': 'https://i.imgur.com/Y3MMaEG.png', // Main product image
  'options': [
    {'name': 'មានបន្ថែម', 'price': 3.00},
    {'name': 'គ្មានបន្ថែម', 'price': 2.00},
  ],
};

final List<Map<String, dynamic>> recommendedProducts = [
  {
    'name': 'សម្លម្ជូរគ្រឿង',
    'price': 2.00,
    'image': 'https://i.imgur.com/gK2D3z7.jpeg'
  },
  {
    'name': 'សម្លការីសាច់គោ',
    'price': 2.00,
    'image': 'https://i.imgur.com/zWb6p3H.jpeg'
  },
  {
    'name': 'សម្លការីសាច់មាន់',
    'price': 2.00,
    'image': 'https://i.imgur.com/6a5wO3a.jpeg'
  },
  {
    'name': 'សម្លការីសាច់ទា',
    'price': 2.00,
    'image': 'https://i.imgur.com/hYyBvGd.jpeg'
  },
];
// --- END MOCK DATA ---

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  // State to manage the selected radio button option
  int _selectedOptionIndex = 0;
  double _totalPrice = productData['price'];

  @override
  void initState() {
    super.initState();
    // Initialize price based on the default selected option
    _updatePrice(0);
  }

  void _updatePrice(int index) {
    setState(() {
      _selectedOptionIndex = index;
      _totalPrice = productData['options'][index]['price'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Top Image with Overlay Icons
            _buildImageHeader(),

            // 2. Product Information (Name, Price, Description)
            _buildProductInfo(),

            // 3. Selectable Options with Radio Buttons
            _buildOptionsSection(),

            // 4. Recommended Products Section
            _buildRecommendationsSection(),
          ],
        ),
      ),
      // 5. Bottom Navigation Bar for "Add to Cart"
      bottomNavigationBar: _buildBottomAddToCartBar(),
    );
  }

  /// Builds the top image with back and favorite buttons.
  Widget _buildImageHeader() {
    return Stack(
      children: [
        Image.network(
          productData['image'],
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 40,
          left: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.white),
              onPressed: () {
                // Handle favorite action
              },
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the product name, price, and description section.
  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productData['name'],
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '\$ ${productData['price'].toStringAsFixed(2)}',
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          const SizedBox(height: 16),
          const Text(
            'ការពិពណ៌នា',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            productData['description'],
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  /// Builds the selectable options with radio buttons.
  Widget _buildOptionsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ជ្រើសរើសបន្ថែម',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ...List.generate(productData['options'].length, (index) {
            final option = productData['options'][index];
            return RadioListTile<int>(
              title: Text(option['name']),
              secondary: Text('\$ ${option['price'].toStringAsFixed(2)}'),
              value: index,
              groupValue: _selectedOptionIndex,
              onChanged: (value) {
                if (value != null) {
                  _updatePrice(value);
                }
              },
              activeColor: Colors.green,
            );
          }),
        ],
      ),
    );
  }

  /// Builds the "Recommended" section with a grid of products.
  Widget _buildRecommendationsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'ណែនាំ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('មើល​ទាំងអស់',
                    style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recommendedProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              final product = recommendedProducts[index];
              return RecommendedProductCard(
                name: product['name'],
                price: product['price'],
                imageUrl: product['image'],
              );
            },
          ),
        ],
      ),
    );
  }

  /// Builds the persistent bottom bar for adding to cart.
  Widget _buildBottomAddToCartBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.shopping_cart_outlined, color: Colors.green),
              Text(
                '\$ ${_totalPrice.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.CART);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'បញ្ចូលទៅក្នុងកន្ត្រក',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

/// A reusable card for the recommended products grid.
class RecommendedProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String imageUrl;

  const RecommendedProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$ ${price.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.black54),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child:
                  const Text('ទិញឥឡូវ', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
