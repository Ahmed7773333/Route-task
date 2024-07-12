import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/get_itt.dart' as di;
import '../bloc/home_layout_bloc.dart';
import '../widgets/product_item.dart';
import '../widgets/route_logo.dart';
import '../widgets/search_field.dart';

// ignore: must_be_immutable
class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  final TextEditingController searchBarController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    di.init();
  }

  @override
  Widget build(BuildContext context) {
    // final colorss = Theme.of(context).colorScheme;

    return BlocProvider<HomeLayoutBloc>(
      create: (context) => di.sl<HomeLayoutBloc>()..add(GetAllProductsEvent()),
      child: BlocConsumer<HomeLayoutBloc, HomeLayoutState>(
        builder: (BuildContext context, state) {
          final HomeLayoutBloc bloc = HomeLayoutBloc.get(context);
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    routeLogo(),
                    SizedBox(height: 18.h),
                    Row(
                      children: [
                        SearchBarField(
                          hint: AppStrings.searchHint,
                          controller: searchBarController,
                          onChange: () {},
                          onPressed: () {},
                        ),
                        SizedBox(width: 24.w),
                        Image.asset(
                          AppImages.cart,
                          color: AppColors.secondry,
                          height: 30.h,
                          width: 30.w,
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.transparent,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: (191 / 245),
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16),
                        itemCount: bloc.productsList.length,
                        itemBuilder: (context, index) {
                          var item = bloc.productsList[index];
                          return productItem(item, context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, HomeLayoutState? state) {
          if (state is GetAllProductsErrorState) {
            debugPrint(state.error.message);
          }
        },
      ),
    );
  }
}
