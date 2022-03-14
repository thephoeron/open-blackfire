;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :cl-user)

(defpackage "OPEN-BLACKFIRE/ASDF"
  (:nicknames blackfire/asdf)
  (:use cl asdf uiop))

(in-package :open-blackfire/asdf)

(defsystem open-blackfire
  :name "OPEN-BLACKFIRE"
  :description "Vendor-agnostic quantum computing framework for Common Lisp."
  :author "\"the Phoeron\" Colin J.E. Lupton"
  :source-control "https://github.com/thephoeron/open-blackfire/"
  :bug-tracker "https://github.com/thephoeron/open-blackfire/issues/"
  :mailto "thephoeron@protonmail.com"
  :version (:read-file-form "VERSION")
  :license "MIT"
  :depends-on (closer-mop
               alexandria
               serapeum
               dexador
               ;quri
               uri-template
               yason
               json-mop
               ; json-schema
               cl-strings
               simple-config)
  :serial t
  :components ((:module protocol-phi
                :components ((:file "package")
                             (:file "generic-api")
                             (:file "quantum-objects")))
               (:module quantum-cloud
                :components ((:module ibm-quantum
                              :components ((:file "package")
                                           (:file "component-objects")
                                           (:file "programs")
                                           (:file "jobs")
                                           (:file "devices")
                                           (:file "auth")))))
               (:file "blackfire"))
  :perform (load-op :after (op c)
             (provide :blackfire)
             (pushnew :blackfire *features*))
  :in-order-to ((test-op (test-op "open-blackfire/test"))))

(defsystem open-blackfire/docs
  :name "OPEN-BLACKFIRE/DOCS"
  :description "Documentation for OPEN-BLACKFIRE."
  :author "\"the Phoeron\" Colin J.E. Lupton"
  :source-control "https://github.com/thephoeron/open-blackfire/"
  :bug-tracker "https://github.com/thephoeron/open-blackfire/issues/"
  :mailto "thephoeron@protonmail.com"
  :version (:read-file-form "VERSION")
  :license "MIT"
  :depends-on ()
  :serial t
  :components ()
  :perform ()
  :in-order-to ())

(defsystem open-blackfire/test
  :name "OPEN-BLACKFIRE/TEST"
  :description "Test-bench for OPEN-BLACKFIRE."
  :author "\"the Phoeron\" Colin J.E. Lupton"
  :source-control "https://github.com/thephoeron/open-blackfire/"
  :bug-tracker "https://github.com/thephoeron/open-blackfire/issues/"
  :mailto "thephoeron@protonmail.com"
  :version (:read-file-form "VERSION")
  :license "MIT"
  :depends-on ()
  :serial t
  :components ()
  :perform ()
  :in-order-to ())
