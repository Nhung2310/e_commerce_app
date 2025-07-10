import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/data/product_data.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/product_card.dart';
import 'package:e_commerce_app/ui/product_card_screen.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';
import 'package:e_commerce_app/ui/categories/filters_screen.dart';
import 'package:e_commerce_app/model/product.dart'; // <<< THÊM DÒNG NÀY: Cần import model Product
// lib/ui/catalog1_screen.dart

// import 'package:e_commerce_app/widget/app_assets.dart'; // <<< CÓ THỂ KHÔNG CẦN NẾU KHÔNG DÙNG TRỰC TIẾP

// >>>

class Catalog1Screen extends StatefulWidget {
  const Catalog1Screen({super.key});

  @override
  State<Catalog1Screen> createState() => _Catalog1ScreenState();
}

class _Catalog1ScreenState extends State<Catalog1Screen> {
  bool _isView = false;
  String _selectedSortOption = 'Popular';
  String? _selectedSize;

  // <<< THÊM CÁC BIẾN TRẠNG THÁI MỚI VÀ KHỞI TẠO
  String _selectedFilterSubCategory =
      'All'; // Biến để quản lý lựa chọn lọc sub-category
  List<Product> _displayProducts = []; // Danh sách sản phẩm sẽ hiển thị
  // >>>

  @override
  void initState() {
    super.initState();
    _applyFiltersAndSort(); // <<< GỌI HÀM LỌC VÀ SẮP XẾP KHI KHỞI TẠO TRANG
  }

  // <<< HÀM LỌC VÀ SẮP XẾP SẢN PHẨM
  void _applyFiltersAndSort() {
    // 1. Lọc sản phẩm chỉ thuộc mainCategory 'Tops' và genderCategory 'Women'
    List<Product> tempProducts = mockProducts.where((product) {
      // Đảm bảo Product model của bạn có các thuộc tính này (mainCategory, genderCategory, subCategories)
      return product.mainCategory == 'Tops' &&
          product.genderCategory == 'Women';
    }).toList();

    // 2. Lọc theo sub-category nếu có lựa chọn khác 'All'
    if (_selectedFilterSubCategory != 'All') {
      tempProducts = tempProducts
          .where(
            (product) =>
                product.subCategories.contains(_selectedFilterSubCategory),
          )
          .toList();
    }

    // 3. Sắp xếp sản phẩm (giữ nguyên logic sắp xếp của bạn)
    switch (_selectedSortOption) {
      case 'Popular':
        tempProducts.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'Newest':
        // Giả sử có một trường 'id' hoặc 'createdAt' để sắp xếp theo newest
        // Nếu không có, bạn có thể sắp xếp theo tên hoặc thứ tự mặc định
        tempProducts.sort((a, b) => b.id.compareTo(a.id));
        break;
      case 'Customer review':
        tempProducts.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'Price: lowest to high':
        // Cần đảm bảo newPrice có thể parse thành double
        tempProducts.sort(
          (a, b) => double.parse(
            a.newPrice.replaceAll('\$', ''),
          ).compareTo(double.parse(b.newPrice.replaceAll('\$', ''))),
        );
        break;
      case 'Price: highest to low':
        tempProducts.sort(
          (a, b) => double.parse(
            b.newPrice.replaceAll('\$', ''),
          ).compareTo(double.parse(a.newPrice.replaceAll('\$', ''))),
        );
        break;
      default:
        break;
    }

    setState(() {
      _displayProducts = tempProducts;
    });
  }
  // >>>

  // <<< HÀM LẤY CÁC SUB-CATEGORY DUY NHẤT ĐỂ HIỂN THỊ TRÊN CÁC NÚT LỌC
  List<String> _getUniqueSubCategoriesForTops() {
    Set<String> subCategories = {'All'}; // Luôn có 'All' là lựa chọn đầu tiên
    for (var product in mockProducts) {
      if (product.mainCategory == 'Tops' && product.genderCategory == 'Women') {
        subCategories.addAll(product.subCategories);
      }
    }
    // Chuyển Set thành List và sắp xếp (ví dụ: theo bảng chữ cái)
    List<String> sortedSubCategories = subCategories.toList();
    // Bạn có thể tùy chỉnh thứ tự sắp xếp ở đây nếu muốn 'T-shirts', 'Crop tops' luôn ở đầu
    sortedSubCategories.sort((a, b) {
      if (a == 'All') return -1; // Đảm bảo 'All' luôn ở đầu
      if (b == 'All') return 1;
      return a.compareTo(b);
    });
    return sortedSubCategories;
  }
  // >>>

  @override
  Widget build(BuildContext context) {
    // <<< LẤY DANH SÁCH CÁC SUB-CATEGORY ĐỂ HIỂN THỊ NÚT LỌC
    final List<String> subCategoryFilters = _getUniqueSubCategoriesForTops();
    // >>>

    return Scaffold(
      backgroundColor: AppColor.whiteBackgroundColor,
      appBar: _isView
          ? AppBar(
              leading: IconButtonBack(
                iconButtonBack: () {
                  Navigator.of(context).pop();
                },
              ),
              title: null,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                    child: TextHeadLine(text: 'Women’s tops'),
                  ),
                ),
              ),
            )
          : AppBar(
              leading: IconButtonBack(
                iconButtonBack: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Center(child: TextHeadLine(text: 'Women’s tops')),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              ],
            ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: subCategoryFilters.length,
                itemBuilder: (context, index) {
                  final filterName = subCategoryFilters[index];
                  return ButtonCatalog(
                    text: filterName,
                    isSelected: _selectedFilterSubCategory == filterName,
                    onTap: () {
                      setState(() {
                        _selectedFilterSubCategory = filterName;
                        _applyFiltersAndSort();
                      });
                    },
                  );
                },
              ),
            ),
            Container(
              height: 40,
              color: AppColor.whiteBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FiltersButton(
                    iconButton: const Icon(Icons.filter_list),
                    text: 'Filters',
                    functionButtonClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FiltersScreen(),
                        ),
                      );
                    },
                  ),
                  FiltersButton(
                    iconButton: const Icon(Icons.swap_vert),
                    text: _selectedSortOption,
                    functionButtonClick: () {
                      _showSortOptions();
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isView = !_isView;
                      });
                    },
                    icon: _isView
                        ? const Icon(Icons.view_module)
                        : const Icon(Icons.view_list),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),

            Expanded(
              child: _displayProducts.isEmpty
                  ? const Center(child: Text('Không có sản phẩm phù hợp.'))
                  : _isView
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _displayProducts
                                  .length, // <<< DÙNG _displayProducts
                              itemBuilder: (context, index) {
                                final product =
                                    _displayProducts[index]; // <<< LẤY PRODUCT TỪ _displayProducts
                                return ProductCardList(
                                  product: product,
                                  textLabel: '',
                                  colorTextLabel: AppColor.whiteColor,
                                  colorLabel: AppColor.redColorBox,
                                  onTap: () {
                                    showModelBottomSheetSize(product);
                                  },
                                  onDoubleTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductCardScreen(product: product),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(12),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              childAspectRatio: 150 / 290,
                            ),
                        itemCount: _displayProducts.length,
                        itemBuilder: (context, index) {
                          final product = _displayProducts[index];
                          return ProductCard(
                            product: product,
                            onTap: () {
                              showModelBottomSheetSize(product);
                            },
                            onDoubleTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductCardScreen(product: product),
                                ),
                              );
                            },
                            colorTextLabel: AppColor.whiteColor,
                            colorLabel: Colors.transparent,
                          );
                        },
                      ),
                    ),
            ),
            // >>>
          ],
        ),
      ),
    );
  }

  void _showSortOptions() {
    final List<String> sortOptions = [
      'Popular',
      'Newest',
      'Customer review',
      'Price: lowest to high',
      'Price: highest to low',
    ];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateBottomSheet) {
            return SizedBox(
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Sort by',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: sortOptions.length,
                      itemBuilder: (context, index) {
                        final optionText = sortOptions[index];
                        final bool isSelected =
                            _selectedSortOption == optionText;

                        return InkWell(
                          onTap: () {
                            setStateBottomSheet(() {
                              _selectedSortOption = optionText;
                            });

                            setState(() {
                              _selectedSortOption = optionText;
                              _applyFiltersAndSort();
                            });
                            Navigator.pop(context);
                          },
                          child: TextSortBy(
                            text: optionText,
                            backgroundColor: isSelected
                                ? AppColor.redColor
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // <<< THAY ĐỔI showModelBottomSheetSize ĐỂ NHẬN ĐỐI TƯỢNG PRODUCT
  void showModelBottomSheetSize(Product product) {
    // Reset selected size khi mở bottom sheet mới
    _selectedSize = null;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateBottomSheet) {
            return Container(
              height: 360,
              color: AppColor.whiteBackgroundColor,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'Select size',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: product.sizes.map((size) {
                        return _buildSizeOption(size, setStateBottomSheet);
                      }).toList(),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Size info'),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_right),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ButtonOnclick(
                      textButton: 'ADD TO CART',
                      functionButtonClick: () {
                        if (_selectedSize != null) {
                          print(
                            'Kích thước đã chọn: $_selectedSize cho sản phẩm: ${product.itemName}',
                          );

                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Vui lòng chọn một kích thước.'),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
  // >>>

  // <<< THAY ĐỔI _buildSizeOption ĐỂ NHẬN StateSetter CỦA BOTTOM SHEET
  Widget _buildSizeOption(String size, StateSetter setStateBottomSheet) {
    bool isSelected = (_selectedSize == size);
    return GestureDetector(
      onTap: () {
        setStateBottomSheet(() {
          // Cập nhật state của bottom sheet
          _selectedSize = size;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 90,
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? AppColor.redColor : Colors.transparent,
            border: Border.all(
              color: isSelected ? AppColor.redColor : AppColor.grayColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              size,
              style: TextStyle(
                color: isSelected ? AppColor.whiteColor : AppColor.blackColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // >>>
}
