import 'package:weartest/counter/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wear/wear.dart';
import 'package:weartest/cubit/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  final WearMode mode;
  const CounterPage(this.mode, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: CounterView(mode: mode),
    );
  }
}

class CounterView extends StatefulWidget {
  final WearMode mode;
  const CounterView({required this.mode, super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    Color textColor =
        widget.mode == WearMode.active ? Colors.white : Colors.black;
    return Scaffold(
      backgroundColor:
          widget.mode == WearMode.active ? Colors.white : Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Counter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 20,
                child: ElevatedButton(
                    onPressed: () => context.read<CounterCubit>().increment(),
                    child: const Icon(
                      Icons.add,
                      size: 14,
                    )),
              ),
              const SizedBox(
                height: 4,
              ),
              const CounterText(),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 20,
                child: ElevatedButton(
                    onPressed: () => context.read<CounterCubit>().decrement(),
                    child: const Icon(
                      Icons.remove,
                      size: 14,
                    )),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 20,
                child: ElevatedButton(
                    onPressed: () => context.read<CounterCubit>().reset(),
                    child: const Icon(
                      Icons.refresh,
                      size: 14,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      builder: (context, count) {
        return Text(
          '$count',
          style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
        );
      },
    );
  }
}