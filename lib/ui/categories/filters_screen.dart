import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';
import 'package:e_commerce_app/ui/categories/filter_list_brand_screen.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  SfRangeValues _values = const SfRangeValues(40.0, 80.0);

  final List<bool> _selectedColors = [false, false, false, false, false, false];
  final List<Color> _colors = [
    AppColor.blackColor,
    AppColor.whiteColorInFilter,
    AppColor.redColor,
    AppColor.grayColor,
    AppColor.amberColor,
    const Color.fromARGB(255, 12, 52, 85),
  ];

  final List<bool> _selectedSizes = [false, false, false, false, false];
  final List<String> _sizes = ['XS', 'S', 'M', 'L', 'XL'];

  final List<bool> _selectedCategory = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBackgroundColor,
      appBar: AppBar(
        leading: IconButtonBack(
          iconButtonBack: () {
            Navigator.pop(context);
          },
        ),
        title: Center(child: TextHeadLine(text: 'Filters')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCategoriesCard(text: 'Price range'),

            Container(
              height: 80,
              color: AppColor.whiteColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Container(
                          child: Positioned(
                            left: (_values.start / 200) * 300 - 20,
                            child: Text(
                              '\$${_values.start.toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Positioned(
                            left: (_values.end / 200) * 300 - 20,
                            child: Text(
                              '\$${_values.end.toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SfRangeSlider(
                        min: 0.0,
                        max: 100.0,
                        values: _values,

                        showTicks: false,
                        // showLabels: true,
                        enableTooltip: true,
                        activeColor: AppColor.redColor,
                        numberFormat: NumberFormat('\$'),
                        onChanged: (SfRangeValues values) {
                          setState(() {
                            _values = values;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextCategoriesCard(text: 'Colors'),
            ),
            Container(
              height: 100,
              color: AppColor.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: List.generate(_colors.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedColors[index] = !_selectedColors[index];
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: _colors[index],
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _selectedColors[index]
                                ? AppColor.redColor
                                : Colors.transparent,
                            width: 2.0,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextCategoriesCard(text: 'Sizes'),
            ),
            Container(
              height: 80,
              color: AppColor.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: List.generate(_sizes.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedSizes[index] = !_selectedSizes[index];
                        });
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: _selectedSizes[index]
                              ? AppColor.redColor
                              : Colors.transparent,

                          border: Border.all(
                            color: _selectedSizes[index]
                                ? AppColor.redColor
                                : AppColor.grayColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            _sizes[index],
                            style: TextStyle(
                              color: _selectedSizes[index]
                                  ? AppColor.whiteColor
                                  : AppColor.blackColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextCategoriesCard(text: 'Category'),
            ),
            Container(
              height: 150,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      rectangleCategory('All', 0),
                      rectangleCategory('Women', 1),
                      rectangleCategory('Men', 2),
                    ],
                  ),
                  Row(
                    children: [
                      rectangleCategory('Boys', 3),
                      rectangleCategory('Girls', 4),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Brand',
                          style: const TextStyle(
                            fontSize: 18,
                            color: AppColor.blackColor,
                          ),
                        ),
                        TextBrandName(
                          text: 'adidas Originals, Jack & Jones, s.Oliver',
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FilterListBrandScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.keyboard_arrow_right, size: 40),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: AppColor.whiteColor,
              height: 100,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},

                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.whiteColor,
                        side: const BorderSide(color: AppColor.blackColor),
                        fixedSize: const Size(160, 36),
                      ),
                      child: const Text(
                        'Discard',
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},

                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.redColorBox,
                        fixedSize: const Size(160, 36),
                        shadowColor: AppColor.redColorBox.withAlpha(64),
                      ),
                      child: const WhiteText(text: 'Apply'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rectangleCategory(String category, int index) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedCategory[index] = !_selectedCategory[index];
          });
        },
        child: Container(
          width: 90,
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: _selectedCategory[index] ? Colors.red : Colors.transparent,
            border: Border.all(
              color: _selectedCategory[index] ? Colors.red : Colors.grey,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              category,
              style: TextStyle(
                color: _selectedCategory[index] ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
