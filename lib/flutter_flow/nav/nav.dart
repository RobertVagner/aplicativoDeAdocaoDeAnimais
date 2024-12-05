import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginCadastroWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginCadastroWidget(),
        ),
        FFRoute(
          name: 'PaginaDeConversa',
          path: '/paginaDeConversa',
          builder: (context, params) => PaginaDeConversaWidget(
            groupImg: params.getParam(
              'groupImg',
              ParamType.String,
            ),
            groupName: params.getParam(
              'groupName',
              ParamType.String,
            ),
            chatId: params.getParam(
              'chatId',
              ParamType.int,
            ),
            chatMembros: params.getParam<String>(
              'chatMembros',
              ParamType.String,
              isList: true,
            ),
            chatDescription: params.getParam(
              'chatDescription',
              ParamType.String,
            ),
            isChatGroup: params.getParam(
              'isChatGroup',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'FeedAdotante',
          path: '/feedAdotante',
          builder: (context, params) => FeedAdotanteWidget(
            idUserPubli: params.getParam(
              'idUserPubli',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ConfiguracaoUser',
          path: '/configuracaoUser',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ConfiguracaoUser')
              : ConfiguracaoUserWidget(),
        ),
        FFRoute(
          name: 'ListaDeMensagens',
          path: '/listaDeMensagens',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ListaDeMensagens')
              : ListaDeMensagensWidget(),
        ),
        FFRoute(
          name: 'LoginCadastro',
          path: '/loginCadastro',
          builder: (context, params) => LoginCadastroWidget(),
        ),
        FFRoute(
          name: 'AnimalCadastro',
          path: '/cadastroAnimal',
          builder: (context, params) => AnimalCadastroWidget(),
        ),
        FFRoute(
          name: 'CadastroUser',
          path: '/cadastroUser',
          builder: (context, params) => CadastroUserWidget(),
        ),
        FFRoute(
          name: 'MeusAnimais',
          path: '/meusAnimais',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'MeusAnimais')
              : MeusAnimaisWidget(),
        ),
        FFRoute(
          name: 'EditarUser',
          path: '/editarUser',
          builder: (context, params) => EditarUserWidget(),
        ),
        FFRoute(
          name: 'Veterinarios',
          path: '/veterinarios',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Veterinarios')
              : VeterinariosWidget(),
        ),
        FFRoute(
          name: 'AnimalCarteira',
          path: '/carteiraAnimal',
          builder: (context, params) => AnimalCarteiraWidget(
            idAnimal: params.getParam(
              'idAnimal',
              ParamType.String,
            ),
            nomeAnimal: params.getParam(
              'nomeAnimal',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ContatoDetalhesPage',
          path: '/contatoDetalhesPage',
          builder: (context, params) => ContatoDetalhesPageWidget(
            nome: params.getParam(
              'nome',
              ParamType.String,
            ),
            profileImg: params.getParam(
              'profileImg',
              ParamType.String,
            ),
            bio: params.getParam(
              'bio',
              ParamType.String,
            ),
            chatId: params.getParam(
              'chatId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'GrupoDetalhesPage',
          path: '/grupoDetalhesPage',
          builder: (context, params) => GrupoDetalhesPageWidget(
            chatId: params.getParam(
              'chatId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'VacinaCadastro',
          path: '/vacinaCadastro',
          builder: (context, params) => VacinaCadastroWidget(
            idAnimal: params.getParam(
              'idAnimal',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'VacinaEditar',
          path: '/vacinaEditar',
          builder: (context, params) => VacinaEditarWidget(
            idVacinacao: params.getParam(
              'idVacinacao',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'CadastroPost',
          path: '/cadastroPost',
          builder: (context, params) => CadastroPostWidget(),
        ),
        FFRoute(
          name: 'QrCodeAnimal',
          path: '/qrCodeAnimal',
          builder: (context, params) => QrCodeAnimalWidget(
            nomeAnimal: params.getParam(
              'nomeAnimal',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'CadastroAnimaisPost',
          path: '/cadastroAnimaisPost',
          builder: (context, params) => CadastroAnimaisPostWidget(),
        ),
        FFRoute(
          name: 'CadastroDoacao',
          path: '/cadastroDoacao',
          builder: (context, params) => CadastroDoacaoWidget(),
        ),
        FFRoute(
          name: 'AnimaisPerdidos2',
          path: '/animaisPerdidos2',
          builder: (context, params) => AnimaisPerdidos2Widget(
            cidadeTeste: params.getParam(
              'cidadeTeste',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HomePage')
              : HomePageWidget(
                  cidadeTeste: params.getParam(
                    'cidadeTeste',
                    ParamType.String,
                  ),
                ),
        ),
        FFRoute(
          name: 'EditarAnimal',
          path: '/editarAnimal',
          builder: (context, params) => EditarAnimalWidget(
            idanimal: params.getParam(
              'idanimal',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/loginCadastro';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
