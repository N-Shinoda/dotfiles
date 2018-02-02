;; 環境を日本語にする
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(prefer-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)

;; load-pathの追加関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
              (normal-top-level-add-subdirs-to-load-path))))))

;; load-pathに追加するディレクトリ
(add-to-load-path "elisp" "elpa")

;; repository for package-list-packages
(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; MELPA-stableを追加
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; MARMALADEを追加
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;;初期化
(package-initialize)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(setq ac-use-menu-map t)
(setq ac-use-fuzzy t)

;; magit
;;(global-set-key (kbd "C-x g") 'magit-status)

;; "C-t"でウィンドウ切り替える。初期値はtranspose-chars
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)

;;; キーバインド
(define-key global-map "\C-h" 'delete-backward-char) ; 削除
(define-key global-map "\M-?" 'help-for-help) ; ヘルプ
(define-key global-map "\C-\\" nil) ; \C-\の日本語入力の設定を無効にする

;; スタートアップメッセージを表示させない
(setq inhibit-startup-message t)

;; バックアップファイルを作成しない
(setq make-backup-files nil)

;; バックアップファイルの作成先を~/.existに変更する
;;(setq backup-directory-alist '((".*" . "~/.exist"))

;; オートセーブファイルを作成しない
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)

;; ロックファイルを作成しない
(setq create-lockfiles nil)

;; C-k 1回で行全体を削除する
(setq kill-whole-line t)

;; 行の最後に来ても、新しい行を作らない
(setq next-line-add-newlines nil)

;; リージョンを色付きにする
(transient-mark-mode 1)

;; 予約語を色分けする
(global-font-lock-mode 1)

;; スクロールを1行ずつにする
(setq scroll-step 1)

;; タブ幅
(setq default-tab-width 4)

;; タブにスペースを使用する
(setq-default indent-tabs-mode nil)

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)

;; c-modeのインデント幅(style)を変更する
(add-hook 'c-mode-common-hook
          '(lambda ()
             (c-set-style "k&r")
             (setq c-basic-offset 4)
             (setq indent-tabs-mode t)
             (setq tab-width 4)))

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

;; unvisualize menubar, toolbar, scrollbar
;;(menu-bar-mode 0)
;;(tool-bar-mode 0)
;;(scrroll-bar-mode 0)

;; メニューバーを消す
;;(menu-bar-mode -1)

;; ツールバーを消す
;;(tool-bar-mode -1)

;; 列数を表示する
(column-number-mode t)

;; 行数を表示する
(global-linum-mode t)

;; ;;対応する()を光らせる
(show-paren-mode 1)

;; リージョンを色付きにする
(transient-mark-mode 1)

;; Clipboardを他のアプリケーションと共通に
(cond (window-system
        (setq x-select-enable-clipboard t)
        ))

