abstract class AppStates {}

class AppStateInitial extends AppStates{}

class AppStateLoading extends AppStates{}

class AppStateGetLanguage extends AppStates{}

class AppStateSetAppDirection extends AppStates{}

class AppStateSetAppFontFamily extends AppStates{}

class AppStateSetAppThemeMode extends AppStates{}

class AppStateChangeAppThemeMode extends AppStates{}

class AppStateGetHomeDataSuccess extends AppStates{}

class AppStateRefreshHomeDataSuccess extends AppStates{}

class AppStateGetHomeDataError extends AppStates{}