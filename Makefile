freezed:
	dart run build_runner build --delete-conflicting-outputs

clean:
	flutter clean
	flutter pub get
	dart run build_runner build --delete-conflicting-outputs