(defun pal-get-char-above-or-below (delta)
  (save-excursion
    (let ( (orig-column (current-column)) )
      (forward-line delta)
      (forward-char orig-column)
      (if (eq orig-column (current-column))
          (buffer-substring (point) (+ 1 (point)))
        nil))))

(defun pal-insert-char-above-or-below (delta)
  (let ( (insertee (pal-get-char-above-or-below delta)) )
    (when (and insertee (not (equal insertee "\n")))
      (insert insertee))))

(defun pal-insert-char-above ()
  (interactive)
  (pal-insert-char-above-or-below -1))

(defun pal-insert-char-below ()
  (interactive)
  (pal-insert-char-above-or-below 1))

 
 
