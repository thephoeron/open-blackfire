;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :open-blackfire/quantum-cloud/ibm-quantum)

(defmethod clear-authorization-cache ()
  "Clear the authorization cache for the specified user. This is useful if a user's role changes."
  (handler-case (dex:post #U{*ibmq-server*}/authorize)
    ;; 204 Cache successfully deleted
    ;; 500 Internal error
    (dex:http-request-failed (e)
      ;; also return an ERROR-CONTAINER response object as specified by the OpenAPI definition
      (format *error-output* "The server at ~S returned ~D" *ibmq-server* (dex:response-status e)))))
