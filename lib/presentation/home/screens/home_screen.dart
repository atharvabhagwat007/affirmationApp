import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailyAffirmationss/core/constants/color_constants.dart';
import 'package:dailyAffirmationss/core/di/di.dart';
import 'package:dailyAffirmationss/core/utils/date_time_utils.dart';
import 'package:dailyAffirmationss/presentation/home/bloc/home_bloc.dart';
import 'package:dailyAffirmationss/presentation/home/bloc/home_event.dart';
import 'package:dailyAffirmationss/presentation/home/bloc/home_state.dart';
import 'package:dailyAffirmationss/presentation/home/widgets/affirmation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _appBar(),
      body: BlocProvider<HomeBloc>(
        create: (context) => Injector.resolve<HomeBloc>(),
        child: const HomeScreenbody(),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      backgroundColor: ColorConstants.black87,
      title: const Text(
        'Affirmations',
      ),
    );
  }
}

class HomeScreenbody extends StatelessWidget {
  const HomeScreenbody({super.key});

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getGreeting(),
          const SizedBox(
            height: 10,
          ),
          _getData(),
        ],
      ),
    );
  }

  Widget _getData() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is LoadingAffirmationState) {
          _loadAffirmation(context);
        } else if (state is LoadedAffirmationState) {
          return _getAffirmationCategoryList(state);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _loadAffirmation(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(LoadingAffirmationEvent());
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.blueGrey,
      ),
    );
  }

  Widget _getAffirmationCategoryList(LoadedAffirmationState state) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: state.affirmationList.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => AffirmationItem(
        affimation: state.affirmationList[index],
      ),
    );
  }

  Widget _getGreeting() {
    return Text(
      "${DateTimeUtils.greeting()}!",
      style: const TextStyle(
        color: ColorConstants.cFFFFFF,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
