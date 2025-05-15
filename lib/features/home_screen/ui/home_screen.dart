import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/helpers/spacing.dart';
import 'package:new_e_commerce_app/core/theming/app_theme.dart';
import 'package:new_e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:new_e_commerce_app/features/home_screen/data/models/categories_model.dart';
import 'package:new_e_commerce_app/features/home_screen/logic/product_cubit.dart';
import 'package:new_e_commerce_app/features/home_screen/ui/widgets/category_item_widget.dart';
import 'package:new_e_commerce_app/features/home_screen/ui/widgets/product_grid_view_bloc_builder.dart';

import '../../../core/theming/app_colors.dart';
import '../logic/categories_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().getCategories();
    context.read<ProductCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(28),
        Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Text("Discover", style: AppTheme.font32BlackSemiBold),
        ),
        verticalSpace(16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            children: [
              CustomTextField(
                width: 281.w,
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.textFieldGreyColor,
                  size: 30,
                ),
                hintText: "Search for clothes...",
                hintStyle: AppTheme.font16GreyRegular,
              ),
              horizontalSpace(8),
              Container(
                width: 52.w,
                height: 52.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.tune_outlined, color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
        verticalSpace(16),
        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesSuccess) {
              final List<Datum>? categories = state.categoryModel.data;
              return Padding(
                padding: EdgeInsetsDirectional.only(start: 24.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        categories!.map((category) {

                      return CategoryItemWidget(categoryName: category.name ?? "All",
                        onTap: () {
                          setState(() {
                            selectedCategory = category.name ?? "All";
                            if(selectedCategory == "All") {
                              context.read<ProductCubit>().getProducts();
                            }else {
                              log(category.id.toString());
                              context.read<ProductCubit>().getProductsCategory(category.id ?? "");
                            }
                          });
                          // context.read<ProductCubit>().getProductsCategory(selectedCategory);
                        },
                        isSelected: selectedCategory == category.name,);
                    }).toList(),
                  ),
                ),
              );
            }
            if(state is CategoriesError) {
              return Padding(
                padding: EdgeInsetsDirectional.only(start: 24.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                    List.generate(6, (index) => CategoryItemWidget(categoryName: state.error, isSelected: false,)),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        verticalSpace(16),
        ProductsGridViewBlocBuilder(selectedCategory: (value) {
          setState(() {
            selectedCategory = value;
          });
        }),
      ],
    );
  }
}
