;;;; Case mapping — ICU u_strTo* / Python str.casefold themes (root locale).

(in-package #:unicode-backend-icu4j/tests)

(deftest casefold-full
  (ok (string= (casefold "ß") "ss"))
  (ok (string= (casefold "Straße") "strasse"))
  (ok (string= (casefold "ABC") "abc")))

(deftest simple-case-code-points
  (ok (= (simple-downcase #\A) (char-code #\a)))
  (ok (= (simple-upcase #\a) (char-code #\A)))
  (ok (= (simple-casefold #\A) (char-code #\a)))
  ;; U+01C5 LATIN CAPITAL LETTER D WITH SMALL LETTER Z WITH CARON — title ≠ upper
  (ok (= (simple-titlecase #x01C5) #x01C5))
  (ok (= (simple-upcase #x01C5) #x01C4)))

(deftest string-case-roundtrip
  (ok (string= (downcase "AbC") "abc"))
  (ok (string= (upcase "AbC") "ABC"))
  (ok (string= (titlecase "hello world") "Hello World")))

(deftest greek-sigma-case
  (ok (string= (downcase "ABC") "abc"))
  (ok (member (downcase "Σ") '("σ" "ς") :test #'string=)))
