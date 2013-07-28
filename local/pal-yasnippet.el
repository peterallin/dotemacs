(yas/initialize)
(yas/load-directory (concat thirdparty-path "yasnippets"))
(yas/load-directory (concat local-path "yasnippets"))

(set 'yas/window-system-popup-function 'yas/x-popup-menu-for-template)

(set-face-background 'yas/field-highlight-face "dark grey")
