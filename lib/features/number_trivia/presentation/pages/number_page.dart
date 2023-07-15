import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/themes/size_config.dart';
import '../../../../injection.dart';
import '../bloc/number_bloc.dart';

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
  late String inputStr;
  /*
	
	BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
	
	*/
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NumberBloc, NumberState>(
      listener: (context, state) {
        state.resultFailureOrSuccessOption.fold(
          () {},
          (either) {
            either.fold(
              (failure) {
                failure.maybeMap(
                  // Use localized strings here in your apps
                  serverFailure: (_) =>
                      const MessageDisplay(message: 'Server Failure'),
                  cacheFailure: (_) =>
                      const MessageDisplay(message: 'Cache Failure'),
                  //invalidEnteredValueByUser: (_) => 'Email already in use',
                  unknownFailure: (_) =>
                      const MessageDisplay(message: 'Unknown Failure'),
                  orElse: () => const MessageDisplay(
                      message: 'Unknown Failure. PLease contact support'),
                );
              },
              (_) {
                /*
					Router.navigator.pushReplacementNamed(Router.notesOverviewPage);
					context
						.bloc<AuthBloc>()
						.add(const AuthEvent.authCheckRequested());
				  */
              },
            );
          },
        );
      },
      builder: (context, state) {
        return Center(
          child: (state.isSubmitting)
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )

              //} else {
              : Padding(
                  padding: EdgeInsets.all(SizeConfig.height! * 0.05),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.height! * 0.05,
                      ),
                      //Center(
                      //	height: SizeConfig().height * 0.3,
                      //	child:  Column(
                      //		children: [

                      const NumberDisplay(number: "Number"),
                      const MessageDisplay(message: "result msg"),
                      //		],
                      //	),
                      //),
                      SizedBox(
                        height: SizeConfig.height! * 0.05,
                      ),
                      Form(
                        autovalidateMode: state.showErrorMsg,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controller,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Input a number',
                              ),
                              autocorrect: false,
                              onChanged: (value) {
                                inputStr = value;
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
                            SizedBox(
                              height: SizeConfig.height! * 0.05,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () => context
                                        .read<NumberBloc>()
                                        .add(const NumberEvent
                                            .getConcreteNumberButtonPressed()),
                                    child: const Text('Get Concrete'),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () => context
                                        .read<NumberBloc>()
                                        .add(const NumberEvent
                                            .getRandomNumberButtonPressed()),
                                    child: const Text('Get Random'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          //},
        );
      },
    );
  }
}

class MessageDisplay extends StatelessWidget {
  final String message;
  const MessageDisplay({required this.message, super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height! * 0.3,
      child: Expanded(
        child: Center(
          child: SingleChildScrollView(
            child: Text(
              message,
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class NumberDisplay extends StatelessWidget {
  final String number;
  const NumberDisplay({required this.number, super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height! * 0.3,
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}


/*
builder: (context, state) {
        return Form(
          autovalidate: state.showErrorMessages,
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: <Widget>[
              const Text(
                '📝',
              ).textAlignment(TextAlign.center).fontSize(130),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                ),
                autocorrect: false,
                onChanged: (value) => context
                    .bloc<SignInFormBloc>()
                    .add(SignInFormEvent.emailChanged(value)),
                validator: (_) => context
                    .bloc<SignInFormBloc>()
                    .state
                    .emailAddress
                    .value
                    .fold(
                      (f) => f.maybeMap(
                        invalidEmail: (_) => 'Invalid email',
                        orElse: () => null,
                      ),
                      (_) => null,
                    ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                // controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                obscureText: true,
                autocorrect: false,
                onChanged: (value) => context
                    .bloc<SignInFormBloc>()
                    .add(SignInFormEvent.passwordChanged(value)),
                validator: (_) =>
                    context.bloc<SignInFormBloc>().state.password.value.fold(
                          (f) => f.maybeMap(
                            shortPassword: (_) => 'Short password',
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
              ),
              const SizedBox(height: 8),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      onPressed: () => context.bloc<SignInFormBloc>().add(
                          const SignInFormEvent
                              .signInWithEmailAndPasswordPressed()),
                      child: const Text('SIGN IN'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FlatButton(
                      onPressed: () => context.bloc<SignInFormBloc>().add(
                          const SignInFormEvent
                              .registerWithEmailAndPasswordPressed()),
                      child: const Text('REGISTER'),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () => context
                    .bloc<SignInFormBloc>()
                    .add(const SignInFormEvent.signInWithGooglePressed()),
                color: Colors.lightBlue,
                child: const Text(
                  'SIGN IN WITH GOOGLE',
                ).textColor(Colors.white).bold(),
              ),
              if (state.isSubmitting) ...[
                const SizedBox(height: 8),
                const LinearProgressIndicator(value: null),
              ]
            ],
          ),
        );
      },

*/


/*

class _TriviaControlsState extends State<TriviaControls> {
  final controller = TextEditingController();
  String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a number',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                child: Text('Search'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: dispatchConcrete,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: RaisedButton(
                child: Text('Get random trivia'),
                onPressed: dispatchRandom,
              ),
            ),
          ],
        )
      ],
    );
  }

  void dispatchConcrete() {
    // Clearing the TextField to prepare it for the next inputted number
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .dispatch(GetTriviaForConcreteNumber(inputStr));
  }

  void dispatchRandom() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .dispatch(GetTriviaForRandomNumber());
  }
}

*/