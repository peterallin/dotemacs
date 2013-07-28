(require 'thingatpt)

; This seems to be needed when using lgrep and rgrep non-interactively
(grep-compute-defaults)

(defvar pal-rgrep-topdir "~/")
(defvar pal-rgrep-files "*.cpp *.cxx *.h *.cc *.h *.CPP *.CXX *.CC *.H")

(defun pal-choose-rgrep-topdir (topdir)
  (interactive "DTop directory for recursive grepping: ") 
  (set 'pal-rgrep-topdir (expand-file-name topdir))
  )

(defun pal-rgrep-at-point ()
  (interactive)
  (let
      ((sym (or (thing-at-point 'symbol)
                (error "No symbol at point"))))
    (rgrep sym pal-rgrep-files pal-rgrep-topdir)
    )
  )

(defun pal-current-buffer-file ()
 (car (last (split-string (buffer-file-name) "/"))))

(defun pal-current-buffer-path ()
  (mapconcat 'identity 
             (reverse (cdr (reverse (split-string (buffer-file-name) "/"))))
             "/"))

(defun pal-grep-at-point-in-file ()
  (interactive)
  (let
      ((sym (or (thing-at-point 'symbol)
                (error "No symbol at point"))))
    (lgrep sym (pal-current-buffer-file) (pal-current-buffer-path))
    )
  )

(defun pal-buffer-exists (buf)
  (if (get-buffer buf) t nil))

; TODO: Ignore if "*grep*" is current buffer
(defun pal-switch-to-grep-buffer ()
  (interactive)
  (if (pal-buffer-exists "*grep*")
      (switch-to-buffer-other-window "*grep*")
    (error "No grep buffer")))

