/// A sealed class representing the different states of the home screen.
///
/// This class serves as the base type for all states that the home
/// screen can be in. It is used to manage and represent the various
/// UI states within the home screen context.
sealed class HomeState {}

/// A state representing the initial state of the home screen.
///
/// This class is a concrete implementation of [HomeState] and indicates
/// that the home screen is in its initial loading state. It can be used
/// to show loading indicators or initial UI elements until the
/// actual data is ready.
class HomeInitialState extends HomeState {}
