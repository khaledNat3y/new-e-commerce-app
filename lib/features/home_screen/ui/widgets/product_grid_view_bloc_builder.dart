import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_e_commerce_app/features/home_screen/ui/widgets/product_grid_view.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../logic/product_cubit.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  final ValueChanged<String> selectedCategory;
  const ProductsGridViewBlocBuilder({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if(state is ProductSuccess) {
          return ProductsGridView(products: state.products, selectedCategory: (value) {
            selectedCategory(value);
          },);
        }else if(state is ProductLoading) {
          return const Center(child: LoadingWidget(),);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
