(defpackage #:unicode-backend-icu4j/tests
  (:use #:cl #:rove #:unicode-protocol #:unicode-backend-icu4j))

(in-package #:unicode-backend-icu4j/tests)

#+abcl
(deftest backend-smoke
  (use-icu4j-backend)
  (ok (typep *unicode-backend* 'icu4j-backend))
  (ok (member :breaks (backend-capabilities *unicode-backend*)))
  (ok (eq :lu (general-category #\A)))
  (ok (string= "é" (normalize (concatenate 'string "e" (string (code-char #x0301)))
                               :form :nfc)))
  (ok (string= "xn--mnchen-3ya.de" (idna-name-to-ascii "münchen.de")))
  (let ((it (make-break-iterator :word :locale "en")))
    (break-set-text it "a b")
    (ok (= 0 (break-first it))))
  (let ((set (make-unicode-set :pattern "[0-9]")))
    (ok (uset-contains-p set #\5))))

#-abcl
(deftest skip
  (ok t))
