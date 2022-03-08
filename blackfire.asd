;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :cl-user)

(defpackage "BLACKFIRE/ASDF"
  (:use cl asdf uiop))

(in-package :blackfire/asdf)

(defsystem blackfire
  :name "BLACKFIRE"
  :description "Vendor-agnostic quantum computing framework for Common Lisp."
  :author "\"the Phoeron\" Colin J.E. Lupton"
  :source-control "https://github.com/thephoeron/open-blackfire/"
  :bug-tracker "https://github.com/thephoeron/open-blackfire/issues/"
  :mailto "thephoeron@protonmail.com"
  :version (:read-file-form "VERSION")
  :license "MIT"
  :depends-on (open-blackfire)
  :serial nil)
