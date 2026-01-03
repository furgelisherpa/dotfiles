# Enable system clipbord
# for older qutebrowser_version
# c.content.javascript.can_access_clipboard = True
# for newer qutebrowser_version
c.content.javascript.clipboard = "access"
# Adblocker
c.content.blocking.method = 'both'
# When to show the status bar.
c.statusbar.show = 'never'
# Tabs
c.tabs.position = 'left'
c.tabs.show = 'switching'
# Enable dark mode
c.colors.webpage.darkmode.enabled = True
# Default editor
c.editor.command = ['emacsclient', '-c', '-a', 'emacs', '{file}']

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# Cookies
config.set('content.cookies.accept', 'no-3rdparty', 'chrome-devtools://*')
config.set('content.cookies.accept', 'no-3rdparty', 'devtools://*')

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')

# User agent
c.content.headers.user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36'
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# Load images automatically in web pages.
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow locally loaded documents to access remote URLs.
config.set('content.local_content_can_access_remote_urls', True, 'file:///home/pstivy/.local/share/qutebrowser/userscripts/*')
config.set('content.local_content_can_access_file_urls', False, 'file:///home/pstivy/.local/share/qutebrowser/userscripts/*')

# Bindings for normal mode
config.bind('M', 'hint links spawn mpv {hint-url}')

# Load theme
config.source(config.configdir / 'gruvbox.py')
