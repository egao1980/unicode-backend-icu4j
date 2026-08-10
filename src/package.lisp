(defpackage #:unicode-backend-icu4j
  (:use #:cl #:unicode-protocol)
  (:local-nicknames (#:icu #:cl-stack-icu4j))
  (:export #:icu4j-backend
           #:use-icu4j-backend
           #:*icu4j-backend*))

(in-package #:unicode-backend-icu4j)
