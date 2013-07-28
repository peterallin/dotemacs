(defun pal-fullscreen ()
  (interactive)
  (if (eq system-type 'gnu/linux)
      (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                             '(2 "_NET_WM_STATE_FULLSCREEN" 0))
    (message "Unsupported platform")
    )
  )




