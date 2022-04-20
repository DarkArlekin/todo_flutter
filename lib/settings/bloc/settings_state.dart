part of 'settings_bloc.dart';

enum SettingsStatus { initial, success, failure }
enum SaveTodoMethod { local, hosted }

class SettingsState extends Equatable {
  const SettingsState(
      {this.status = SettingsStatus.initial,
      this.saveMethod = SaveTodoMethod.local});

  final SettingsStatus status;
  final SaveTodoMethod saveMethod;

  SettingsState copyWith({
    SettingsStatus? status,
    SaveTodoMethod? saveMethod,
  }) {
    return SettingsState(
      status: status ?? this.status,
      saveMethod: saveMethod ?? this.saveMethod,
    );
  }

  @override
  List<Object> get props => [status, saveMethod];
}
