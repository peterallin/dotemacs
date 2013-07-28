(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

(c-set-offset 'substatement-open 0)
(c-set-offset 'brace-list-open 0)

(defun pal-c-initialization-hook ()
  (subword-mode 1)
  (c-toggle-hungry-state 1)
  (set-variable 'truncate-lines 1)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
)

(add-hook 'c-mode-hook 'pal-c-initialization-hook)
(add-hook 'c++-mode-hook 'pal-c-initialization-hook)
