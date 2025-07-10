import 'package:flutter/material.dart';
import 'package:e_commerce_app/model/review.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/image_picker.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';
import 'package:e_commerce_app/widget/start_rating_widget.dart';

class RatingAndReviewsScreen extends StatefulWidget {
  const RatingAndReviewsScreen({super.key});

  @override
  State<RatingAndReviewsScreen> createState() => _RatingAndReviewsScreenState();
}

class _RatingAndReviewsScreenState extends State<RatingAndReviewsScreen> {
  bool _isScrolled = false;
  final ScrollController _scrollController = ScrollController();
  bool _isChecked = false;

  final List<Review> _allReviews = [
    Review(
      reviewerName: 'Helene Moore',
      date: 'June 5, 2019',
      rating: 4,
      reviewText:
          'The dress is great! Very classy and comfortable. It fit perfectly! I\'m 5\'7" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn\'t recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.',
      avatarUrl: AppAssets.avatar,
      photoUrls: [AppAssets.avatar, AppAssets.avatar],
    ),
    Review(
      reviewerName: 'John Doe',
      date: 'July 1, 2019',
      rating: 5,
      reviewText:
          'Excellent product, highly recommended! Very pleased with the quality and fit.',
      avatarUrl: AppAssets.avatar,
      photoUrls: [AppAssets.avatar],
    ),
    Review(
      reviewerName: 'Jane Smith',
      date: 'August 10, 2019',
      rating: 3,
      reviewText:
          'Good but expected better for the price. The material felt a bit thin.',
      avatarUrl: AppAssets.avatar,
      photoUrls: [],
    ),
    Review(
      reviewerName: 'Alice Johnson',
      date: 'September 20, 2019',
      rating: 5,
      reviewText: 'Perfect! Exactly what I was looking for. Will buy again.',
      avatarUrl: AppAssets.avatar,
      photoUrls: [AppAssets.avatar, AppAssets.avatar, AppAssets.avatar],
    ),
    Review(
      reviewerName: 'Bob Williams',
      date: 'October 1, 2019',
      rating: 2,
      reviewText:
          'Disappointed with the sizing. It ran much smaller than expected.',
      avatarUrl: AppAssets.avatar,
      photoUrls: [],
    ),
    Review(
      reviewerName: 'Charlie Brown',
      date: 'November 15, 2019',
      rating: 4,
      reviewText:
          'Nice dress, good material. A bit tight around the shoulders but otherwise great.',
      avatarUrl: AppAssets.avatar,
      photoUrls: [AppAssets.avatar],
    ),
    Review(
      reviewerName: 'Diana Prince',
      date: 'December 1, 2019',
      rating: 5,
      reviewText: 'Absolutely stunning! Received many compliments.',
      avatarUrl: AppAssets.avatar,
      photoUrls: [AppAssets.avatar, AppAssets.avatar],
    ),
    Review(
      reviewerName: 'Edward Kenway',
      date: 'January 10, 2020',
      rating: 3,
      reviewText:
          'It\'s okay, but the color was slightly different from the picture.',
      avatarUrl: AppAssets.avatar,
      photoUrls: [],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 100 && !_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      } else if (_scrollController.offset <= 100 && _isScrolled) {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final Map<int, double> ratingPercentages = {
    5: 0.65,
    4: 0.20,
    3: 0.10,
    2: 0.03,
    1: 0.02,
  };

  Widget _buildRatingBar(int rating) {
    final percentage = ratingPercentages[rating]!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(
                rating,
                (index) => const Icon(
                  Icons.star,
                  color: AppColor.amberColor,
                  size: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColor.grayColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: percentage,
                        child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: AppColor.redColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 40,
                  child: Text(
                    '${(percentage * 100).toInt()}%',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(Review review) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topLeft,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.whiteColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  TextNameUser(textNameUser: review.reviewerName),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index < review.rating
                                ? Icons.star
                                : Icons.star_border,
                            color: AppColor.amberColor,
                            size: 16,
                          ),
                        ),
                      ),
                      TextDate(textDate: review.date),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextReview(textReview: review.reviewText),
                  ),
                  const SizedBox(height: 16),
                  if (_isChecked &&
                      review.photoUrls != null &&
                      review.photoUrls!.isNotEmpty)
                    SizedBox(
                      height: 104,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: review.photoUrls!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                review.photoUrls![index],
                                width: 104,
                                height: 104,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      width: 104,
                                      height: 104,
                                      color: Colors.grey,
                                      child: const Icon(Icons.error),
                                    ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextDate(textDate: 'Helpful'),
                      const SizedBox(width: 8),
                      const Icon(Icons.thumb_up_alt, color: AppColor.grayColor),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: -10.0,
            top: 0.0,
            child: Material(
              color: AppColor.whiteColor,
              elevation: 4,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: review.avatarUrl != null
                      ? AssetImage(review.avatarUrl!)
                      : null,
                  child: review.avatarUrl == null
                      ? const Icon(Icons.person, size: 25)
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildReviewsList() {
    List<Review> filteredReviews = _isChecked
        ? _allReviews
              .where(
                (review) =>
                    review.photoUrls != null && review.photoUrls!.isNotEmpty,
              )
              .toList()
        : _allReviews;

    if (filteredReviews.isEmpty) {
      return [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              'No reviews available with photos.',
              style: TextStyle(fontSize: 16, color: AppColor.grayColor),
            ),
          ),
        ),
      ];
    }
    return filteredReviews.map((review) => _buildReviewCard(review)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBackgroundColor,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar.medium(
                backgroundColor: AppColor.whiteBackgroundColor,
                leading: IconButtonBack(
                  iconButtonBack: () {
                    Navigator.pop(context);
                  },
                ),
                title: _isScrolled
                    ? const Text(
                        'Rating and reviews',
                        style: const TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : TextHeadLine(text: 'Rating & Reviews'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.more_horiz,
                        color: AppColor.blackColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              const Text(
                                '4.3',
                                style: TextStyle(
                                  fontSize: 44,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Subtitle(text: '23 ratings'),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              children: List.generate(
                                5,
                                (index) => _buildRatingBar(5 - index),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${_allReviews.length} reviews',
                            style: const TextStyle(
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                                checkColor: AppColor.whiteColor,
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color?>((
                                      states,
                                    ) {
                                      if (states.contains(
                                        MaterialState.selected,
                                      )) {
                                        return AppColor.blackColor;
                                      }
                                      return AppColor.whiteColor;
                                    }),
                                side: const BorderSide(
                                  color: AppColor.grayColor,
                                ),
                              ),
                              const Text(
                                'With photo',
                                style: TextStyle(fontSize: 17.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    ..._buildReviewsList(),

                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: IgnorePointer(
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColor.whiteBackgroundColor.withOpacity(0.0),
                      AppColor.whiteBackgroundColor.withOpacity(0.9),
                      AppColor.whiteBackgroundColor.withOpacity(1.0),
                    ],
                    stops: const [0.0, 0.7, 1.0],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 30,

            right: 12,
            child: Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  showModelBottomSheetReview(context);
                  print('Write a review button pressed');
                },
                icon: const Icon(Icons.edit, color: AppColor.whiteColor),
                label: const Text(
                  'Write a review',
                  style: TextStyle(fontSize: 14, color: AppColor.whiteColor),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.redColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  elevation: 5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showModelBottomSheetReview(BuildContext context) {
    double _finalRating = 0.0;
    final _reviewTextController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateInBottomSheet) {
            final double keyboardHeight = MediaQuery.of(
              context,
            ).viewInsets.bottom;
            return FractionallySizedBox(
              // heightFactor: 0.85,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: AppColor.whiteBackgroundColor,
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 16.0,
                    bottom: 16.0 + keyboardHeight,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 8),

                        Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 16),

                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(
                            child: Text(
                              'What is your rate?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        StarRatingInput(
                          starCount: 5,
                          iconSize: 50,
                          initialRating: _finalRating.toDouble(),
                          onRatingChanged: (newRating) {
                            setStateInBottomSheet(() {
                              _finalRating = newRating;
                            });
                            print('Số sao được chọn: $_finalRating');
                          },
                        ),
                        const SizedBox(height: 24),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Center(
                            child: Text(
                              'Please share your opinion about the product',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            controller: _reviewTextController,
                            decoration: InputDecoration(
                              hintText: 'Your review',

                              alignLabelWithHint: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: AppColor.whiteColor,
                              filled: true,
                            ),
                            keyboardType: TextInputType.multiline,
                            minLines: 5,
                            maxLines: null,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Đánh giá không được để trống.';
                              }
                              if (value.length < 10) {
                                return 'Đánh giá phải có ít nhất 10 ký tự.';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        const ImagePickerWidget(),
                        const SizedBox(height: 24),
                        ButtonOnclick(
                          textButton: 'SEND REVIEW',
                          functionButtonClick: () {
                            if (_formKey.currentState!.validate()) {
                              if (_finalRating == 0) {
                                setStateInBottomSheet(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Vui lòng chọn số sao để đánh giá.',
                                      ),
                                    ),
                                  );
                                });
                                return;
                              }

                              Navigator.pop(context);
                            }
                          },
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
