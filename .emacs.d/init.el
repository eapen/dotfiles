(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/color-theme")
(add-to-list 'load-path "~/.emacs.d/icicles")

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell
         (replace-regexp-in-string
          "[ \t\n]*$"
          ""
          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(defmacro try-this (&rest body)
  `(unwind-protect
       (let (retval (gensym))
         (condition-case ex
             (setq retval (progn ,@body))
           ('error
            (message (format "Caught exception: [%s]" ex))
            (setq retval (cons 'exception (list ex)))))
         retval)))

(defmacro try-independently (&rest body)
  (let (retval (gensym))
    (dolist (x body retval) ()
            (push `(try-this ,x) retval))
    (setq retval (reverse retval))
    (push 'progn retval)))

(defun auto-load-mode (mode extensions &optional mode-fn)
  ; If not already a list, wrap it in one.
  (setq extensions (if (listp extensions) extensions (list extensions))
        extension-fn (if mode-fn mode-fn (symbol-name mode))
        regex (concat "\\(" (mapconcat 'identity extensions "\\|") "\\)\\'"))
  (autoload mode extension-fn nil t)
  (add-to-list 'auto-mode-alist (cons regex mode)))

(defun mapply (func args)
  (dolist (someargs args)
    (apply func someargs)))

; Setup menu's etc.
(setq inhibit-startup-message t
      require-final-newline t
      ring-bell-function 'ignore
      mac-pass-command-to-system nil
      mac-option-key-is-meta nil
      mac-option-modifier 'hyper
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      ac-auto-start nil)

(setq-default indent-tabs-mode nil)
(global-auto-revert-mode 1)
(column-number-mode 1)
(show-paren-mode t)
(menu-bar-mode -1)

(defun window-mode-init ()
  "Set things up for a gui window."
  (set-exec-path-from-shell-PATH)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (tooltip-mode -1)
  (set-fringe-mode 2)

  (require 'midnight)
  (midnight-delay-set 'midnight-delay "4:30am")

  (require 'show-wspace)
  (require 'color-theme-justin)
  (color-theme-justin))

(defun text-mode-init ()
  "Set up for quick loading on a terminal window."
  (color-theme-dark-green))

(require 'color-theme)
(color-theme-initialize)
(if window-system
    (window-mode-init)
  (text-mode-init))

;; icicles
(require 'icicles)
(icy-mode)

(defun condense-whitespace ()
  "Kill the whitespace between two non-whitespace characters"
  (interactive "*")
  (save-excursion
    (save-restriction
      (save-match-data
        (progn
          (re-search-backward "[^ \t\r\n]" nil t)
          (re-search-forward "[ \t\r\n]+" nil t)
          (replace-match " " nil nil))))))

(mapply 'global-set-key
        `((,(kbd "RET") newline-and-indent)
          (,(kbd "M-RET") ns-toggle-fullscreen)
          (,(kbd "C-\\") condense-whitespace)
          (,(kbd "M-c") kill-ring-save)
          (,(kbd "C-;") auto-complete)
          (,(kbd "H-n") flymake-goto-next-error)))

;; Auto mode loading
(mapply 'auto-load-mode
        '((js2-mode ("\\.js" "\\.json") "js2")
          (html-mode "\\.html")
          (css-mode "\\.css")
          (coffee-mode "\\.coffee")
          (jinja2-mode "\\.jinja" "jinja2")
          (yaml-mode ("\\.yml" "\\.yaml"))
          (python-mode "\\.py" "python")
          (nxml-mode
           ("\\.xml" "\\.wsdl" "\\.svg" "\\.xslt"
            "\\.wsdd" "\\.xsl" "\\.rng" "\\.xhtml"))
          (cython-mode ("\\.pyx" "\\.pxd"))
          (go-mode "\\.go")))

(mapply 'add-hook
        '((coffee-mode-hook
           (lambda () (set (make-local-variable 'tab-width) 2)))
          (go-mode-hook
           (lambda () (setq tab-width 4)))
          (nxml-mode-hook
           (lambda () (setq nxml-slash-auto-complete-flag t)))
          (before-save-hook delete-trailing-whitespace)
          (python-mode-hook show-ws-highlight-tabs)
          (python-mode-hook
           (lambda () (if (not (null buffer-file-name)) (flymake-mode))))
          ;(before-save-hook
	  ; gofmt-before-save)))
	  ))

(autoload 'gofmt "go-mode")

;code checking via flymake
(try-this
 (when (load "flymake" t)
   (defun flymake-pylint-init ()
     (list "~/bin/lintrunner.sh"
           (list buffer-file-name)))
   (add-to-list 'flymake-allowed-file-name-masks
                '("^[^\*]+\\.py$" flymake-pylint-init))))

(defun recompile-everything-under-the-sun ()
  (interactive)
  (dolist (path load-path)
    (byte-recompile-directory path 0)))

(defadvice js2-reparse (before json)
  (setq js2-buffer-file-name buffer-file-name))
(ad-activate 'js2-reparse)

(defadvice js2-parse-statement (around json)
  (if (and (= tt js2-LC)
           js2-buffer-file-name
           (string-equal (substring js2-buffer-file-name -5) ".json")
           (eq (+ (save-excursion
                    (goto-char (point-min))
                    (back-to-indentation)
                    (while (eolp)
                      (next-line)
                      (back-to-indentation))
                    (point)) 1) js2-ts-cursor))
      (setq ad-return-value (js2-parse-assign-expr))
    ad-do-it))
(ad-activate 'js2-parse-statement)

