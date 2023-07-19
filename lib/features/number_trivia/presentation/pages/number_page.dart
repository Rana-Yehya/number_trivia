import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:number_trivia/features/number_trivia/presentation/widgets/number_display.dart';
import '../../../../core/themes/size_config.dart';
import '../../../../injection.dart';
import '../bloc/number_bloc.dart';
import '../widgets/message_display.dart';

class NumberPage extends StatelessWidget {
  const NumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Number Trivia"),
      ),
      body: BlocProvider(
        create: (_) => getIt<NumberBloc>(),
        child: const SingleChildScrollView(
          child: NumberView(),
        ),
      ),
    );
  }
}

class NumberView extends StatefulWidget {
  const NumberView({super.key});

  @override
  State<NumberView> createState() => _NumberViewState();
}

class _NumberViewState extends State<NumberView> {
  final controller = TextEditingController();
  late String text;
  late String number;
  @override
  void initState() {
    super.initState();
    text = "Enter a value";
    number = '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NumberBloc, NumberState>(
      listenWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      listener: (context, state) {
        state.resultFailureOrSuccessOption.fold(
          () {number = state.number.getOrCrash(); 
            text = state.text.value;},
          (either) {
            either.fold(
              (failure) {
                failure.maybeMap(
                  serverFailure: (_) =>
                      const MessageDisplay(message: 'Server Failure'),
                  cacheFailure: (_) => text = "Cache Failure",
                  //const MessageDisplay(message: 'Cache Failure'),
                  //invalidEnteredValueByUser: (_) => 'Email already in use',
                  unknownFailure: (_) =>
                      const MessageDisplay(message: 'Unknown Failure. PLease contact support'),
                  orElse: () => text = "",
                );
              },
              (_) {},
            );
          },
        );
      },
      builder: (context, state) {
        return Center(
          child: (state.isSubmitting)
              ? SizedBox(
                  height: SizeConfig.height! * 0.3,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(SizeConfig.height! * 0.01),
                  child: Form(
                    autovalidateMode: state.showErrorMsg,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: SizeConfig.height! * 0.01,
                            ),
                            NumberDisplay(number: number,),
                            //MessageDisplay(message: state.text.value),
                            MessageDisplay(message:/* text == ""? state.text.value : */text),
                            Container(
                              height: SizeConfig.height! * 0.01,
                            ),
                          ],
                        ),
                        TextFormField(
                          cursorColor: Theme.of(context).primaryColor,
                          controller: controller,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Input a number',
                          ),
                          autocorrect: false,
                          onChanged: (value) {
                            return context
                                .read<NumberBloc>()
                                .add(NumberEvent.onNumberChanged(
                                  number: value,
                                ));
                          },
                          validator: (_) => context
                              .read<NumberBloc>()
                              .state
                              .number
                              .value
                              .fold(
                                (f) => f.maybeMap(
                                  invalidEnteredValueByUser: (_) =>
                                      'Invalid Number',
                                  orElse: () => null,
                                ),
                                (_) => null,
                              ),
                        ),
                        Container(
                          height: SizeConfig.height! * 0.05,
                        ),
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(right: SizeConfig.width! * 0.03),),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.clear();
                                  context.read<NumberBloc>().add(
                                      const NumberEvent
                                          .getConcreteNumberButtonPressed());
                                },
                                child: const Text('Get Concrete'),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: SizeConfig.width! * 0.05),),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.clear();
                                  context.read<NumberBloc>().add(
                                      const NumberEvent
                                          .getRandomNumberButtonPressed());
                                },
                                child: const Text('Get Random'),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: SizeConfig.width! * 0.03),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
