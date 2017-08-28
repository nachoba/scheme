;; Installing an egg

;; Suppose we want to isntall the package "uri-common"
;; >$ chicken-install uri-common

;; Then in the REPL we can use it:
;; (use uri-common)

(use uri-common)

(uri-host (uri-reference "http://www.foobar.org"))
