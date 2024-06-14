// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lomaTV/core/widgets/custom_error_widget.dart';
// import 'package:lomaTV/features/search/presentation/mange/search_cubit/search_cubit.dart';
// import 'package:lomaTV/features/search/presentation/mange/search_cubit/search_state.dart';
// import 'package:lomaTV/features/search/presentation/views/widgets/no_result_search.dart';
// import 'package:lomaTV/features/search/presentation/views/widgets/list_view_search_services_result.dart';
// import 'package:lomaTV/features/search/presentation/views/widgets/loading_indicator_list_view_search.dart';
//
// class StateResultSearchBlocBuilder extends StatelessWidget {
//   const StateResultSearchBlocBuilder({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
//       if (state is InitialSearchState) {
//         return const NoResultSearch();
//       } else if (state is SuccessSearchState) {
//         return ListViewSearch(movies: state.movies);
//       } else if (state is FailureSearchState) {
//         return Column(
//           children: [
//             SizedBox(height: MediaQuery.of(context).size.height * .3),
//             CustomErrorWidget(errorMassage: state.error),
//           ],
//         );
//       } else {
//         return const SearchResultLoadingIndicator();
//       }
//     });
//   }
// }
