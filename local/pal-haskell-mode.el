(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))

(defun pal-haskell-mode-hook ()
  (hl-line-mode)
  (set 'truncate-lines t)
  (turn-on-haskell-indent)
  (column-number-mode 1)
  (c-subword-mode t)
)

(add-hook 'haskell-mode-hook 'pal-haskell-mode-hook)
