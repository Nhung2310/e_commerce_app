import 'package:popover/popover.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/menu_pop_up.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/start_rating_widget.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    required this.product,
    this.textLabel = '',
    required this.colorTextLabel,
    this.colorLabel = Colors.transparent,
    this.onTap,
    this.onDoubleTap,
    super.key,
  });

  final Product product;
  final String textLabel;
  final Color colorTextLabel;
  final Color colorLabel;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteBackgroundColor,
      elevation: 0.0,
      shape: const RoundedRectangleBorder(side: BorderSide.none),
      child: SizedBox(
        height: 280,
        width: 150,
        child: Stack(
          children: [
            InkWell(
              onTap: widget.onTap,
              onDoubleTap: widget.onDoubleTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 184,
                        width: 148,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.product.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 6,
                          ),
                          decoration: BoxDecoration(
                            color: widget.colorLabel,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text(
                            widget.textLabel,
                            style: TextStyle(
                              color: widget.colorTextLabel,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StartRatingWidget(
                          startCount: 5,
                          rating: widget.product.rating,
                        ),
                        TextBrandName(text: widget.product.brandName),
                        TextItemProduct(text: widget.product.itemName),
                        TextPrice(
                          oldPrice: widget.product.oldPrice,
                          newPrice: widget.product.newPrice,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 86,
              right: 1,
              child: Material(
                color: Colors.white,
                elevation: 4,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      _isLiked ? Icons.favorite : Icons.favorite_border,
                      color: _isLiked ? Colors.red : Colors.grey,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCardList extends StatefulWidget {
  final Product product;
  final String textLabel;
  final Color colorTextLabel;
  final Color colorLabel;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  const ProductCardList({
    required this.product,
    required this.textLabel,
    required this.colorTextLabel,
    required this.colorLabel,
    this.onTap,
    this.onDoubleTap,
    super.key,
  });

  @override
  State<ProductCardList> createState() => _ProductCardListState();
}

class _ProductCardListState extends State<ProductCardList> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: SizedBox(
        height: 132,

        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,

              height: 120,

              child: Card(
                color: AppColor.whiteColor,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: InkWell(
                  onTap: widget.onTap,
                  onDoubleTap: widget.onDoubleTap,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        widget.product.imageUrl,
                        fit: BoxFit.cover,
                        height: 120,
                        width: 104,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextBrandName(text: widget.product.brandName),
                              TextItemProduct(text: widget.product.itemName),
                              StartRatingWidget(
                                startCount: 5,
                                rating: widget.product.rating,
                              ),
                              TextPrice(
                                oldPrice: widget.product.oldPrice,
                                newPrice: widget.product.newPrice,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              right: 8,
              child: Material(
                color: Colors.white,
                elevation: 4,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      _isLiked ? Icons.favorite : Icons.favorite_border,
                      color: _isLiked ? Colors.red : Colors.grey,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCardGridViewFavorites extends StatefulWidget {
  const ProductCardGridViewFavorites({
    required this.product,
    this.textLabel = '',
    required this.colorTextLabel,
    this.colorLabel = Colors.transparent,
    this.onTap,
    this.onDoubleTap,
    super.key,
  });

  final Product product;
  final String textLabel;
  final Color colorTextLabel;
  final Color colorLabel;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;

  @override
  State<ProductCardGridViewFavorites> createState() =>
      _ProductCardGridViewFavoritesState();
}

class _ProductCardGridViewFavoritesState
    extends State<ProductCardGridViewFavorites> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteBackgroundColor,
      elevation: 0.0,
      shape: const RoundedRectangleBorder(side: BorderSide.none),
      child: SizedBox(
        height: 300,
        width: 150,
        child: Stack(
          children: [
            InkWell(
              onTap: widget.onTap,
              onDoubleTap: widget.onDoubleTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 184,
                        width: 148,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.product.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 6,
                          ),
                          decoration: BoxDecoration(
                            color: widget.colorLabel,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text(
                            widget.textLabel,
                            style: TextStyle(
                              color: widget.colorTextLabel,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StartRatingWidget(
                          startCount: 5,
                          rating: widget.product.rating,
                        ),
                        TextBrandName(text: widget.product.brandName),
                        TextItemProduct(text: widget.product.itemName),
                        Row(
                          children: [
                            RichTextProduct(
                              textItem: 'Color: ',
                              textDetailItem: widget.product.color,
                            ),
                            const SizedBox(width: 12),
                            RichTextProduct(
                              textItem: 'Size: ',
                              textDetailItem: widget.product.size,
                            ),
                          ],
                        ),

                        TextPrice(
                          oldPrice: widget.product.oldPrice,
                          newPrice: widget.product.newPrice,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 86,
              right: 1,
              child: Material(
                color: Colors.white,
                elevation: 4,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    setState(() {});
                  },
                  child: const SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.shopping_bag,
                      color: Colors.red,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCardListViewFavorites extends StatefulWidget {
  final Product product;
  final String textLabel;
  final Color colorTextLabel;
  final Color colorLabel;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  const ProductCardListViewFavorites({
    required this.product,
    required this.textLabel,
    required this.colorTextLabel,
    required this.colorLabel,
    this.onTap,
    this.onDoubleTap,
    super.key,
  });

  @override
  State<ProductCardListViewFavorites> createState() =>
      _ProductCardListViewFavoritesState();
}

class _ProductCardListViewFavoritesState
    extends State<ProductCardListViewFavorites> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: SizedBox(
        height: 132,

        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,

              height: 120,

              child: Card(
                color: AppColor.whiteColor,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: InkWell(
                  onTap: widget.onTap,
                  onDoubleTap: widget.onDoubleTap,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        widget.product.imageUrl,
                        fit: BoxFit.cover,
                        height: 120,
                        width: 104,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextBrandName(text: widget.product.brandName),
                              TextItemProduct(text: widget.product.itemName),
                              Row(
                                children: [
                                  RichTextProduct(
                                    textItem: 'Color: ',
                                    textDetailItem: widget.product.color,
                                  ),
                                  const SizedBox(width: 12),
                                  RichTextProduct(
                                    textItem: 'Size: ',
                                    textDetailItem: widget.product.size,
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  TextPrice(
                                    oldPrice: widget.product.oldPrice,
                                    newPrice: widget.product.newPrice,
                                  ),
                                  const SizedBox(width: 4),
                                  StartRatingWidget(
                                    startCount: 5,
                                    rating: widget.product.rating,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              right: 8,
              child: Material(
                color: Colors.white,
                elevation: 4,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    setState(() {});
                  },
                  child: const SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.shopping_bag,
                      color: Colors.red,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCardListViewMyBag extends StatefulWidget {
  final Product product;
  final String textLabel;
  final Color colorTextLabel;
  final Color colorLabel;
  final VoidCallback? onDeleteProduct;
  final VoidCallback? onTapCard;

  const ProductCardListViewMyBag({
    required this.product,
    required this.textLabel,
    required this.colorTextLabel,
    required this.colorLabel,
    required this.onDeleteProduct,
    required this.onTapCard,

    super.key,
  });

  @override
  State<ProductCardListViewMyBag> createState() =>
      _ProductCardListViewMyBagState();
}

class _ProductCardListViewMyBagState extends State<ProductCardListViewMyBag> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: SizedBox(
        height: 132,

        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,

              height: 120,

              child: Card(
                color: AppColor.whiteColor,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      widget.product.imageUrl,
                      fit: BoxFit.cover,
                      height: 120,
                      width: 104,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextItemProduct(text: widget.product.itemName),
                            Row(
                              children: [
                                RichTextProduct(
                                  textItem: 'Color: ',
                                  textDetailItem: widget.product.color,
                                ),
                                const SizedBox(width: 12),
                                RichTextProduct(
                                  textItem: 'Size: ',
                                  textDetailItem: widget.product.size,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Icon(Icons.remove),
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                  ),
                                ),
                                const Text('1'),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Icon(Icons.add),
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Builder(
                              builder: (BuildContext iconContext) {
                                return GestureDetector(
                                  onTap: () {
                                    showPopover(
                                      context: iconContext,
                                      bodyBuilder: (context) =>
                                          const MenuPopUp(),
                                      width: 170,
                                      height: 96,
                                      backgroundColor:
                                          AppColor.whiteBackgroundColor,
                                      direction: PopoverDirection.left,
                                    );
                                  },
                                  child: const Icon(
                                    Icons.more_vert,
                                    color: AppColor.grayColor,
                                  ),
                                );
                              },
                            ),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Center(
                                child: TextPrice(
                                  oldPrice: '',
                                  newPrice: widget.product.newPrice,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
