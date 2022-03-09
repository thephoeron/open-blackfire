;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :open-blackfire/quantum-cloud/ibm-quantum)

(defmethod list-jobs ())

(defmethod run-job ())

(defmethod list-job-details ())

(defmethod delete-job ())

(defmethod list-job-results ())

(defmethod list-job-interim-results ())

(defmethod list-job-logs ())

(defmethod cancel-job ())

(defmethod get-job-results-stream ())
