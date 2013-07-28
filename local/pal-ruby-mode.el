(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))

(defun pal-ruby-mode-hook ()
  (define-key ruby-mode-map [(return)] 'newline-and-indent)
)

(add-hook 'ruby-mode-hook 'pal-ruby-mode-hook)


