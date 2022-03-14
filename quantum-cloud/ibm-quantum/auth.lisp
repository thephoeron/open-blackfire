;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :open-blackfire/quantum-cloud/ibm-quantum)

(defmethod clear-authorization-cache ()
  "Clear the authorization cache for the specified user. This is useful if a user's role changes."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:post #U{*ibmq-server*}/authorize)
    (case status
      ;; 204 Cache successfully deleted
      (204)
      ;; 500 Internal error
      ;; return an ERROR-CONTAINER response object as specified by the OpenAPI definition
      (500)
      (otherwise))))
