import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutor_me/presentation/pages/login_page.dart';
import 'package:tutor_me/presentation/providers/auth_provider.dart';
import 'package:tutor_me/presentation/providers/card_flip_provider.dart';
import 'package:tutor_me/presentation/providers/chat_provider.dart';
import 'package:tutor_me/presentation/providers/teacher_provider.dart';

import 'data/datasources/auth_remote_data_source.dart';
import 'data/datasources/chat_remote_data_source.dart';
import 'data/datasources/teacher_remote_data_source.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'data/repositories/chat_repository_impl.dart';
import 'data/repositories/teacher_repository_impl.dart';
import 'domain/usecases/chat_usecase.dart';
import 'domain/usecases/get_teachers_usecase.dart';
import 'domain/usecases/login_usecase.dart';
import 'domain/usecases/logout_usecase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Instances of data sources
        Provider(create: (_) => AuthRemoteDataSourceImpl()),
        Provider(create: (_) => TeacherRemoteDataSourceImpl()),
        Provider(create: (_) => ChatRemoteDataSourceImpl()),

        // Repositories with data sources as dependencies
        Provider(
          create: (context) => AuthRepositoryImpl(
            context.read<AuthRemoteDataSourceImpl>(),
          ),
        ),
        Provider(
          create: (context) => TeacherRepositoryImpl(
            context.read<TeacherRemoteDataSourceImpl>(),
          ),
        ),
        Provider(
          create: (context) => ChatRepositoryImpl(
            context.read<ChatRemoteDataSourceImpl>(),
          ),
        ),

        // Providers for use cases
        Provider(
          create: (context) => LoginUseCase(
            context.read<AuthRepositoryImpl>(),
          ),
        ),
        Provider(
          create: (context) => LogoutUseCase(
            context.read<AuthRepositoryImpl>(),
          ),
        ),
        Provider(
          create: (context) => GetTeachersUseCase(
            context.read<TeacherRepositoryImpl>(),
          ),
        ),
        Provider(
          create: (context) => ChatUseCase(
            context.read<ChatRepositoryImpl>(),
          ),
        ),

        // State management providers
        ChangeNotifierProvider(
          create: (context) => AuthProvider(
            context.read<LoginUseCase>(),
            context.read<LogoutUseCase>(),
          ),
        ),
        ChangeNotifierProvider(create: (_) => TeacherProvider()),
        ChangeNotifierProvider(create: (_) => CardFlipProvider()),
        ChangeNotifierProvider(
          create: (context) => ChatProvider(
            context.read<ChatUseCase>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tutor Me',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginPage(),
      ),
    );
  }
}
