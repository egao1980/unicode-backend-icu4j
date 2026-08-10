(in-package #:unicode-backend-icu4j)

#+abcl
(progn
  (defmethod backend-make-break-iterator ((backend icu4j-backend) kind &key locale)
    (declare (ignore backend))
    (make-instance 'break-iterator
                   :kind kind
                   :raw (icu:make-break-iterator kind :locale locale)))

  (defmethod backend-break-set-text ((backend icu4j-backend) iterator text)
    (declare (ignore backend))
    (icu:break-set-text (break-raw iterator) text)
    iterator)

  (defmethod backend-break-first ((backend icu4j-backend) iterator)
    (declare (ignore backend))
    (icu:break-first (break-raw iterator)))

  (defmethod backend-break-last ((backend icu4j-backend) iterator)
    (declare (ignore backend))
    (icu:break-last (break-raw iterator)))

  (defmethod backend-break-next ((backend icu4j-backend) iterator)
    (declare (ignore backend))
    (icu:break-next (break-raw iterator)))

  (defmethod backend-break-previous ((backend icu4j-backend) iterator)
    (declare (ignore backend))
    (icu:break-previous (break-raw iterator)))

  (defmethod backend-break-current ((backend icu4j-backend) iterator)
    (declare (ignore backend))
    (icu:break-current (break-raw iterator)))

  (defmethod backend-break-following ((backend icu4j-backend) iterator offset)
    (declare (ignore backend))
    (icu:break-following (break-raw iterator) offset))

  (defmethod backend-break-preceding ((backend icu4j-backend) iterator offset)
    (declare (ignore backend))
    (icu:break-preceding (break-raw iterator) offset))

  (defmethod backend-break-is-boundary-p ((backend icu4j-backend) iterator offset)
    (declare (ignore backend))
    (icu:break-is-boundary-p (break-raw iterator) offset))
)
