import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/themes/size_config.dart';
import '../../../../injection.dart';
import '../bloc/number_bloc.dart';
import '../widgets/message_display.dart';
import '../widgets/number_display.dart';

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
  late String inputStr= '0';
  /*
	
	BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
	
	*/
  void updateInputStr(String value){


    setState(() {
      inputStr = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NumberBloc, NumberState>(
      listenWhen: (previous, current) => previous.isSubmitting != current.isSubmitting,
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
              (_) 
              {
                updateInputStr(state.number.getOrCrash());
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
                  height: SizeConfig.height! *0.3,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              
              //} else {
              : Padding(
                  padding: EdgeInsets.all(SizeConfig.height! * 0.01),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.height! * 0.01,
                      ),
                      //Center(
                      //	height: SizeConfig().height * 0.3,
                      //	child:  Column(
                      //		children: [
                      // getOrCrash()
                      //NumberDisplay(number: inputStr),
                      MessageDisplay(message: state.text.value),
                      //		],
                      //	),
                      //),
                      SizedBox(
                        height: SizeConfig.height! * 0.01,
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
                                //inputStr = value;
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
                                  flex: 1,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.clear();
                                      context
                                        .read<NumberBloc>()
                                        .add(const NumberEvent
                                            .getConcreteNumberButtonPressed());

                                      print('state in view: ') ;
                                      print(state) ;
                                      
                                            
                                    },
                                    child: const Text('Get Concrete'),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.clear();
                                      context
                                        .read<NumberBloc>()
                                        .add(const NumberEvent
                                            .getRandomNumberButtonPressed());
                                            
                                      //updateInputStr(state.number.getOrCrash());
                                            
                                    },
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