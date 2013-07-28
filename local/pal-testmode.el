(define-derived-mode pal-testmode text-mode "PalTest" "PalTest mode, just for fun"
  (set 'font-lock-defaults pal-testmode-fontlock)  
)

(defvar pal-testmode-fontlock  
  '(
    ("foo" . 'blue)
    ("quux" . 'red)
    )
  )

(add-to-list 'auto-mode-alist '("\\.dd$" . pal-testmode))

