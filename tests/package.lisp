(defpackage #:unicode-backend-icu4j/tests
  (:use #:cl #:rove #:unicode-protocol #:unicode-backend-icu4j))

(in-package #:unicode-backend-icu4j/tests)

(defun %s (&rest cps)
  "Build a string from Unicode scalar values."
  (map 'string #'code-char cps))
