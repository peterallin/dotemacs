;; Library loading
(add-to-list 'load-path (concat thirdparty-path "haskell-mode-2.4"))
(require 'yasnippet)
(require 'js2-mode)
(require 'etags-select)
(require 'ruby-mode)
(require 'inf-ruby)
(require 'filladapt)
(require 'haskell-mode)
(require 'inf-haskell)
(require 'highlight-symbol)
(require 'clojure-mode)

;; Look
(menu-bar-mode 0)
(scroll-bar-mode -1)
(set-variable 'inhibit-splash-screen t)
(tooltip-mode 0)
(tool-bar-mode 0)
(add-to-list 'custom-theme-load-path (concat thirdparty-path "emacs-color-theme-solarized"))
(load-theme 'solarized-dark)

;; Basic behaviour
(cua-mode)
(ido-mode)
(show-paren-mode t)
(set-variable 'backup-inhibited t)
(set-variable 'ring-bell-function (lambda ()) )
(set-variable 'scroll-conservatively most-positive-fixnum)
(set-variable 'kill-whole-line t)
(set-default 'indent-tabs-mode nil) 
(set-default 'truncate-lines 1)
(set-default 'fill-column 100)
(set-default 'filladapt-mode t)
(defalias 'yes-or-no-p 'y-or-n-p)
(set-variable 'compilation-scroll-output 'first-error)
(require 'uniquify)

(setq 
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

;; Enabling of functions that are disabled by default
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; Key bindings

(when (eq system-type 'darwin)
  (set 'mac-function-modifier 'meta) ; meta on the "fn" key
  (set 'mac-option-modifier nil) ; Let the OS determine the meaning of the alt/option key

  (define-key global-map [(super down)] 'windmove-down)
  (define-key global-map [(super up)] 'windmove-up)
  (define-key global-map [(super right)] 'windmove-right)
  (define-key global-map [(super left)] 'windmove-left)
)

(define-key global-map [(meta .)] 'etags-select-find-tag-at-point)
(define-key global-map [(meta :)] 'etags-select-find-tag)
(define-key global-map [(meta -)] 'dabbrev-expand)

(define-key global-map [(meta down)] 'windmove-down)
(define-key global-map [(meta up)] 'windmove-up)
(define-key global-map [(meta right)] 'windmove-right)
(define-key global-map [(meta left)] 'windmove-left)

(define-key global-map [(f9)] 'pal-rgrep-at-point)
(define-key global-map [(shift f9)] 'pal-switch-to-grep-buffer)
(define-key global-map [(control f9)] 'pal-grep-at-point-in-file)
(define-key global-map [(f12)] 'call-last-kbd-macro)
(define-key global-map [(control f12)] '(lambda () (interactive) (compile compile-command)))

(define-key global-map [(control prior)] 'pal-insert-char-above)
(define-key global-map [(control next)] 'pal-insert-char-below)

(define-key global-map [(control f10)] 'highlight-symbol-at-point)
(define-key global-map [(f10)] 'highlight-symbol-next)
(define-key global-map [(shift f10)] 'highlight-symbol-prev)

;; Customizations of modes
(load-library "pal-c-mode")
(load-library "pal-ruby-mode")
(load-library "pal-haskell-mode")
(load-library "pal-python-mode")
(load-library "pal-yasnippet")
(load-library "pal-js2-mode")
(load-library "pal-ido-mode")
(load-library "pal-nxml-mode")
(load-library "pal-cmake-mode")

;; My own stuff
(load-library "pal-rgrep.el") ; help at using rgrep
(load-library "pal-above-below.el")
(load-library "pal-fullscreen.el")


;; CVS
(set 'vc-cvs-stay-local nil) ; avoids annoying tilde files
