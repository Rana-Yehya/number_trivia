class NumberPage extends StatelessWidget {
  const NumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
		appBar: AppBar(
			title: Text("Number Trivia"),
		),
		body: BlocProvider(
			builder: (_) => getIt<NumberBloc>(),
			child: SingleChildScrollView(
			
				child: NumberView(),
			),
		),
	);
  }
}
class NumberView extends StatelessWidget {
  const NumberView({super.key});
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
                    serverFailure: (_) => MessageDisplay('Server Failure'),
                    cacheFailure: (_) => MessageDisplay('Cache Failure'),
                    //invalidEnteredValueByUser: (_) => 'Email already in use',
                    unknownFailure: (_) =>
                        MessageDisplay('Unknown Failure'),
                  ),

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
			
				child: if (state.isSubmitting) (

					Container(
						height: MediaQuery.of(context).size.height / 3,
						child: Center(
							child: CircularProgressIndicator(),
						),
					);

				) else {
					Padding(
						padding: const EdgeInsets.all( SizeConfig().height * 0.05 ),
						child: Column(
							children:[
							
								SizedBox(height: SizeConfig().height * 0.05,),
								//Center(
								//	height: SizeConfig().height * 0.3,
								//	child:  Column(
								//		children: [
										
								NumberDisplay("Number"),
								MessageDisplay("result msg"),
								//		],
								//	),
								//),
								SizedBox(height: SizeConfig().height * 0.05,),
								Column(
									children: [
										TextFormField(),
										SizedBox(height: SizeConfig().height * 0.05,),
										Row(
											children:[
											
												Expanded(
													child: Button() // getConcreteNumber
												
												),
												Expanded(
													child: Button() // getRandomNumber
												
												),
											],
											
										),
									],

								),
							],
						),
					),
				},
			);
	
		},
	
	);
	

  }
}


class MessageDisplay extends StatelessWidget{
	final String message;
	const MessageDisplay{{required this.message ,super.key});

	@override
	Widget build(BuildContext context) {

		return Container(
			height: SizeConfig().height * 0.3,
			child: Expanded( 
				child: Center(
					child: SingleChildScrollView(
					
						child: Text(message, 
							style: TextStyle(fontSize: 25),
							textAlign: TextAlign.center,
							),
					),
				),
			),
		);
	}
}

class NumberDisplay extends StatelessWidget{
	final String number;
	const NumberDisplay{{required this.number ,super.key});

	@override
	Widget build(BuildContext context) {

		return Container(
			height: SizeConfig().height * 0.3,
			child: Center(
				child: Text(number, 
						style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),
						textAlign: TextAlign.center,
						
						),
				
				
			),
		);


	}
}


class NumberControls extends StatefulWidget {
  const NumberControls({
    Key key,
  }) : super(key: key);

  @override
  _NumberControlsState createState() => _NumberControlsState();
}

class _NumberControlsState extends State<NumberControls> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Placeholders here...
      ],
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