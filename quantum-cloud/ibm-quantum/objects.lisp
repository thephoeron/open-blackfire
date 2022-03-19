;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :open-blackfire/quantum-cloud/ibm-quantum)

(defclass check ()
  ((name :json-type :string)
   (status :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass health-response ()
  ((status :json-type :string)
   (checks :json-type (:list check)))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass hub ()
  ((name :json-key "name" :json-type :string)
   (title :json-key "title" :json-type :string)
   (description :json-key "description" :json-type :string)
   (creation-date :json-key "creationDate" :json-type :string)
   (deleted-p :json-key "deleted" :json-type :bool)
   (ui :json-key "ui" :json-type :hash-table)
   (groups :json-key "groups" :json-type :hash-table)
   (private-p :json-key "private" :json-type :bool)
   (license-not-required-p :json-key "licenseNotRequired" :json-type :bool)
   (default-p :json-key "isDefault" :json-type :bool))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass backend ()
  ((name :json-key "name" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass object-storage-info ()
  ((download-q-object-url-endpoint :json-key "downloadQObjectUrlEndpoint" :json-type :string)
   (upload-qobject-url-endpoint :json-key "uploadQobjectUrlEndpoint" :json-type :string)
   (upload-url :json-key "uploadUrl" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass hub-info-hub ()
  ((name :json-key "name" :json-type :string)
   (priority :json-key "priority" :json-type :number))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass hub-info-group ()
  ((name :json-key "name" :json-type :string)
   (priority :json-key "priority" :json-type :number))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass hub-info-project ()
  ((name :json-key "name" :json-type :string)
   (priority :json-key "priority" :json-type :number))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass hub-info ()
  ((hub :json-key "hub" :json-type hub-info-hub)
   (group :json-key "group" :json-type hub-info-group)
   (project :json-key "project" :json-type hub-info-project))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass run-job-response ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass job-input ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass object-storage-url ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass job ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass job-data-uploaded-response ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass info-queue ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass job-status ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass parameter ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass device-props-gate ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass qubit ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass device-properties ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass job-update ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass gate ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass hamiltonian ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass device ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass cmd-def ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass discriminator ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass meas-kernel ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass pulse ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass device-defaults ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass jobs-limit ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass backend-status ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass booking-hub-info-hub ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass booking-hub-info-group ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass booking-hub-info-project ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass booking-hub-info ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass booking ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass date ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass access-token ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass api-token ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass urls ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass user ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass version-response ()
  ()
  (:metaclass json-serializable-class)
  (:documentation ""))
