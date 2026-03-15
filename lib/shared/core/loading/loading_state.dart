part of 'loading_bloc.dart';

class LoadingState extends Equatable {
  final Set<String> activeOperations;
  final Map<String, String> operationLabels;

  const LoadingState({
    this.activeOperations = const {},
    this.operationLabels = const {},
  });

  bool get isLoading => activeOperations.isNotEmpty;
  String? get primaryOperation => activeOperations.firstOrNull;
  String? get primaryOperationLabel => primaryOperation != null ? operationLabels[primaryOperation] : null;

  int get operationCount => activeOperations.length;

  LoadingState copyWith({
    Set<String>? activeOperations,
    Map<String, String>? operationLabels,
    Map<String, double>? operationProgress,
  }) {
    return LoadingState(
      activeOperations: activeOperations ?? this.activeOperations,
      operationLabels: operationLabels ?? this.operationLabels,
    );
  }

  @override
  List<Object?> get props => [activeOperations, operationLabels];

  @override
  String toString() => 'LoadingState(isLoading: $isLoading, operations: $activeOperations)';
}
