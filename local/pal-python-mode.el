(defun pal-python-mode-hook ()
  (auto-fill-mode 1)
)

(add-hook 'python-mode-hook 'pal-python-mode-hook)
