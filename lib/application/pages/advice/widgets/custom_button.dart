// import 'package:advicer/application/pages/advice/bloc/advice_bloc.dart';
import 'dart:math';

import 'package:advicer/application/pages/advice/cubit/advice_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return InkResponse(
      onTap: () {
        // BlocProvider.of<AdviceBloc>(context).add(AdviceRequestedEvent()); // using BloC
        final randomId = 1 + Random().nextInt(12);
        BlocProvider.of<AdviceCubit>(context)
            .adviceRequest(randomId); //using cubit
      },
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: themeData.colorScheme.secondary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text('Get Advice', style: themeData.textTheme.displayLarge),
          ),
        ),
      ),
    );
  }
}
