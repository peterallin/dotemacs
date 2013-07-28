(set-variable 'new-dotemacs-dir (file-name-directory (buffer-file-name)))
(set-variable 'thirdparty-dir (file-name-as-directory (concat new-dotemacs-dir "third-party")))
(set-variable 'local-dir (file-name-as-directory (concat new-dotemacs-dir "local")))
(set-variable 'new-dotemacs-file (concat new-dotemacs-dir ".emacs"))
(set-variable 'home-dotemacs-file (concat (file-name-as-directory (getenv "HOME")) ".emacs"))

;; Rename any existing .emacs file to .emacs.old (overwriting any
;; existing .emacs.old file)
(if (file-exists-p home-dotemacs-file)
    (rename-file home-dotemacs-file (concat home-dotemacs-file ".old") t)
  )

;; Write a .emacs file, that will load the actual initialization
;; file, in the users home directory
(with-temp-buffer
  (insert (format "(add-to-list 'load-path \"%s\")\n" thirdparty-dir))
  (insert (format "(add-to-list 'load-path \"%s\")\n" local-dir))
  (insert (format "(set-variable 'thirdparty-path \"%s\")\n" thirdparty-dir))
  (insert (format "(set-variable 'local-path \"%s\")\n" local-dir))
  (insert (format "(load-file \"%s\")\n" new-dotemacs-file))
  (write-region (point-min) (point-max) home-dotemacs-file)
  )




