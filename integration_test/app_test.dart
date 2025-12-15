/// Integration test runner
///
/// Run all integration tests with:
/// ```bash
/// flutter test integration_test/
/// ```
///
/// Or run on a device/emulator:
/// ```bash
/// flutter test integration_test/app_test.dart
/// ```
library;

import 'auth_flow_test.dart' as auth_flow;
import 'locale_switching_test.dart' as locale;
import 'theme_toggle_test.dart' as theme;

void main() {
  auth_flow.main();
  locale.main();
  theme.main();
}
