(in-package #:unicode-backend-icu4j)

#+abcl
(progn
  (defmethod backend-make-unicode-set ((backend icu4j-backend) &key pattern freeze)
    (declare (ignore backend))
    (make-instance 'unicode-set
                   :raw (icu:make-unicode-set :pattern pattern :freeze freeze)
                   :pattern pattern))

  (defmethod backend-uset-contains-p ((backend icu4j-backend) set object)
    (declare (ignore backend))
    (icu:uset-contains-p (uset-raw set) object))

  (defmethod backend-uset-span ((backend icu4j-backend) set string &key (start 0) end contained)
    (declare (ignore backend end))
    (icu:uset-span (uset-raw set) string :contained contained :start start))

  (defmethod backend-uset-span-back ((backend icu4j-backend) set string &key start end contained)
    (declare (ignore backend end))
    (icu:uset-span-back (uset-raw set) string :contained contained :start start))

  (defmethod backend-uset-size ((backend icu4j-backend) set)
    (declare (ignore backend))
    (icu:uset-size (uset-raw set)))

  (defmethod backend-uset-empty-p ((backend icu4j-backend) set)
    (declare (ignore backend))
    (icu:uset-empty-p (uset-raw set)))

  (defmethod backend-uset-complement ((backend icu4j-backend) set)
    (declare (ignore backend))
    (icu:uset-complement (uset-raw set))
    set)

  (defmethod backend-uset-add ((backend icu4j-backend) set object)
    (declare (ignore backend))
    (icu:uset-add (uset-raw set) object)
    set)

  (defmethod backend-uset-remove ((backend icu4j-backend) set object)
    (declare (ignore backend))
    (icu:uset-remove (uset-raw set) object)
    set)

  (defmethod backend-uset-retain ((backend icu4j-backend) set other)
    (declare (ignore backend))
    (icu:uset-retain (uset-raw set) (uset-raw other))
    set)

  (defmethod backend-uset-clear ((backend icu4j-backend) set)
    (declare (ignore backend))
    (icu:uset-clear (uset-raw set))
    set)
)
