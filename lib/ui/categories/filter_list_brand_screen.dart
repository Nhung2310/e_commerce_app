import 'package:flutter/material.dart';
import 'package:e_commerce_app/model/list_brand.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';

class FilterListBrandScreen extends StatefulWidget {
  const FilterListBrandScreen({super.key});

  @override
  State<FilterListBrandScreen> createState() => _FilterListBrandScreenState();
}

class _FilterListBrandScreenState extends State<FilterListBrandScreen> {
  final allowListBrand = ListBrand(title: 'All');
  final listBrands = [
    ListBrand(title: 'adidas'),
    ListBrand(title: 'adidas Originals'),
    ListBrand(title: 'Blend'),
    ListBrand(title: 'Boutique Moschino'),
    ListBrand(title: 'Champion'),
    ListBrand(title: 'Diesel'),
    ListBrand(title: 'Jack & Jones'),
    ListBrand(title: 'Naf Naf'),
    ListBrand(title: 'Red Valentino'),
    ListBrand(title: 's.Oliver'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButtonBack(
          iconButtonBack: () {
            Navigator.pop(context);
          },
        ),
        title: Center(child: TextHeadLine(text: 'Brand')),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: SearchBar(
              leading: Icon(Icons.search),
              hintText: 'Search',
              backgroundColor: WidgetStatePropertyAll(AppColor.whiteColor),
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildToggleCheckbox(allowListBrand),
                const Divider(),
                ...listBrands.map(buildSingleCheckbox).toList(),
              ],
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
    );
  }

  Widget buildToggleCheckbox(ListBrand listBrand) => buildCheckbox(
    listBrand: listBrand,
    onClicked: () {
      final newValue = !listBrand.value;
      setState(() {
        allowListBrand.value = newValue;
        listBrands.forEach((listBrand) {
          listBrand.value = newValue;
        });
      });
    },
  );

  Widget buildSingleCheckbox(ListBrand listBrand) => buildCheckbox(
    listBrand: listBrand,
    onClicked: () {
      setState(() {
        final newValue = !listBrand.value;
        listBrand.value = newValue;
      });
    },
  );
  Widget buildCheckbox({
    required ListBrand listBrand,
    required VoidCallback onClicked,
  }) => ListTile(
    onTap: onClicked,
    leading: Checkbox(value: listBrand.value, onChanged: (value) => onClicked),
    title: Text(listBrand.title),
  );
}
