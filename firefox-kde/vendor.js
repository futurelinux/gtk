// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Enable default browser checking.
pref("browser.shell.checkDefaultBrowser", true);
pref("browser.search.defaultenginename", "DuckDuckGo");
pref("browser.search.order.extra.duckduckgo", "DuckDuckGo");
pref("browser.search.selectedEngine", "DuckDuckGo");

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);

// Default e10s support to be enabled
pref("browser.tabs.remote.autostart", true);

// Use mozilla location service by default
pref("geo.wifi.uri", "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%");
