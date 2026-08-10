(in-package #:unicode-backend-icu4j)

(defclass icu4j-backend (unicode-backend) ()
  (:documentation "unicode-protocol backend over cl-stack-icu4j (ICU4J / ABCL)."))

(defvar *icu4j-backend* nil)

(defmethod backend-capabilities ((backend icu4j-backend))
  #+abcl
  '(:properties :normalize :nfkc-casefold :casefold :idna :script :emoji
    :char-name :breaks :uset)
  #-abcl
  '())

#-abcl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (warn "unicode-backend-icu4j: designed for ABCL (ICU4J)."))

(defun use-icu4j-backend (&optional (backend (or *icu4j-backend*
                                                 (setf *icu4j-backend*
                                                       (make-instance 'icu4j-backend)))))
  (use-unicode-backend backend)
  backend)

#+abcl
(use-icu4j-backend)
