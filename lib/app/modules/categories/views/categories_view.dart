import 'package:flutter/material.dart';

// Mock data to represent your food items and categories.
// Replace this with your actual data from your controller.
final List<Map<String, String>> topCategories = [
  {'name': 'សម្លការី', 'icon': 'https://i.imgur.com/83Te12C.png'},
  {'name': 'សាច់ក្រក', 'icon': 'https://i.imgur.com/L4yL4vX.png'},
  {'name': 'ភេសជ្ជៈ', 'icon': 'https://i.imgur.com/zJkL6gI.png'},
  {'name': 'បង្អែម', 'icon': 'https://i.imgur.com/r6S3z4g.png'},
  {'name': 'ស៊ុប', 'icon': 'https://i.imgur.com/A9g4E78.png'},
  {'name': 'គុយទាវ', 'icon': 'https://i.imgur.com/Y3MMaEG.png'},
];

final List<String> sideCategories = [
  'សម្លការី',
  'សម្លខ្មែរ',
  'ឆា & 볶음',
  'បង្អែម',
  'ភេសជ្ជៈ',
  'อาหารจานด่วน',
];

final List<Map<String, String>> foodItems = [
  {
    'name': 'សម្លការីសាច់គោ',
    'description': 'សម្លការីសាច់គោ បន្លែគ្រប់មុខឈ្ងុយឆ្ងាញ់',
    'price': '\$ 2.00',
    'image': 'https://i.imgur.com/zWb6p3H.jpeg'
  },
  {
    'name': 'សម្លការីសាច់មាន់',
    'description': 'សម្លការីសាច់មាន់ រស់ជាតិដើមពីអ្នកបាត់ដំបង',
    'price': '\$ 2.00',
    'image': 'https://i.imgur.com/6a5wO3a.jpeg'
  },
  {
    'name': 'សម្លការីសាច់ទា',
    'description': 'សម្លការីសាច់ទា ពិសេសប្រចាំហាង',
    'price': '\$ 2.00',
    'image': 'https://i.imgur.com/hYyBvGd.jpeg'
  },
];

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // 1. Search Bar and Phone Icon
            _buildSearchBar(),

            // 2. Horizontal Top Categories
            _buildTopCategories(),

            const SizedBox(height: 16),

            // 3. Main Content (Side Menu + Food List)
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Side Navigation Menu
                  _buildSideNavMenu(),

                  // Vertical Food Item List
                  _buildFoodList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the top search bar and phone icon
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "ស្វែងរក...",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "ទីតាំង",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.phone, color: Colors.green, size: 28),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  /// Builds the horizontal list of top categories
  Widget _buildTopCategories() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 12),
        itemCount: topCategories.length,
        itemBuilder: (context, index) {
          final cat = topCategories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12, top: 8),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      cat['icon']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  cat['name']!,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Builds the vertical side navigation menu
  Widget _buildSideNavMenu() {
    return SizedBox(
      width: 100, // Fixed width for the side menu
      child: ListView.builder(
        itemCount: sideCategories.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedCategoryIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green.shade50 : Colors.transparent,
                border: isSelected
                    ? const Border(
                        left: BorderSide(color: Colors.green, width: 4),
                      )
                    : null,
              ),
              child: Text(
                sideCategories[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.green : Colors.grey.shade600,
                  fontSize: 13,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Builds the main list of food items on the right
  Widget _buildFoodList() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 12),
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final item = foodItems[index];
          return FoodItemCard(
            title: item['name']!,
            description: item['description']!,
            price: item['price']!,
            imageUrl: item['image']!,
          );
        },
      ),
    );
  }
}

/// A reusable widget for displaying a single food item card.
class FoodItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  const FoodItemCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add,
                            color: Colors.white, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
