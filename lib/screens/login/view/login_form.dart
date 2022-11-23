import 'package:auto_route_example/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../core/components/auth_text_form_field.dart';
import '../bloc/login_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Padding(
        padding: context.paddingNormal,
        child: Align(
          alignment: const Alignment(0, -1 / 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _UsernameInput(),
              Padding(padding: context.paddingLow),
              _PasswordInput(),
              Padding(padding: context.paddingLow),
              _LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (previous, current) =>
              previous.password != current.password,
          builder: (context, state) {
            return AuthTextFormField(
              key: const Key('personalInfoForm_email_textField'),
              labelText: "Lütfen kullanıcı Adı Giriniz",
              onChanged: (email) =>
                  context.read<LoginBloc>().add(LoginUsernameChanged(email)),
              errorText:
                  state.username.invalid ? "Kullanıcı Hatalı Formatta" : null,
            );
          },
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return AuthTextFormField(
          key: const Key('personalInfoForm_password_textField'),
          labelText: "Lütfen parola Giriniz",
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          isPassword: true,
          errorText: state.password.invalid ? "Hatalı Şifre" : null,
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: state.status.isValidated
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
                child: const Text('Giriş Yap'),
              );
      },
    );
  }
}
