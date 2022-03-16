;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :open-blackfire/quantum-cloud/ibm-quantum)

(defmethod create-program (&key name cost description spec public-p data)
  "Upload a new quantum program."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:post #U{*ibmq-server*}/programs
                :headers (list (cons "x-access-token" *ibmq-api-key*))
                :body (yason:encode (make-instance 'program-create
                                      :name name
                                      :cost cost
                                      :description description
                                      :spec spec
                                      :public-p public-p
                                      :data data)))
    (case status
      (201 (json-to-clos body 'program-response))
      (400 (json-to-clos body 'error-container))
      (401 (json-to-clos body 'error-container))
      (403 (json-to-clos body 'error-container))
      (otherwise nil))))

(defmethod list-programs (&key limit offset name search)
  "Returns a list of all programs you uploaded and all public programs."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:get #U{*ibmq-server*}/programs :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (200 (json-to-body body 'programs-response))
      (otherwise nil))))

(defmethod get-program (program-id)
  "Return information about the specified program."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:get #U{*ibmq-server*}/programs/{program-id} :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (200 (json-to-clos body 'program-response))
      (401 (json-to-clos body 'error-container))
      (403 (json-to-clos body 'error-container))
      (404 (json-to-clos body 'error-container))
      (otherwise nil))))

(defmethod delete-program (program-id)
  "Delete the specified program."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:delete #U{*ibmq-server*}/programs/{program-id} :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (204 t)
      (401 (json-to-clos body 'error-container))
      (403 (json-to-clos body 'error-container))
      (404 (json-to-clos body 'error-container))
      (otherwise nil))))

(defmethod update-program (program-id)
  "Update the name, cost, description, or add more backend requirements, parameters, return values, and results.  To update the actual program data, use the PUT enpoint instead."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:patch #U{*ibmq-server*}/programs/{program-id} :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (204 t)
      (400 (json-to-clos body 'error-container))
      (401 (json-to-clos body 'error-container))
      (403 (json-to-clos body 'error-container))
      (404 (json-to-clos body 'error-container))
      (otherwise nil))))

(defmethod update-program-data (program-id)
  "Update the program data for the specified program. To update or add metadata, use the Patch endpoint instead."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:put #U{*ibmq-server*}/programs/{program-id}/data :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (204 t)
      (400 (json-to-clos body 'error-container))
      (401 (json-to-clos body 'error-container))
      (403 (json-to-clos body 'error-container))
      (404 (json-to-clos body 'error-container))
      (otherwise nil))))

(defmethod set-program-public (program-id)
  "Make a program that you uploaded publicly available. Others will be able to view and run the program, but only you will be able to edit it."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:put #U{*ibmq-server*}/programs/{program-id}/public :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (204 t)
      (400 (json-to-clos body 'error-container))
      (401 (json-to-clos body 'error-container))
      (403 (json-to-clos body 'error-container))
      (404 (json-to-clos body 'error-container))
      (otherwise nil))))

(defmethod set-program-private (program-id)
  "Make a program private. You can only make a program private if you uploaded it."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:put #U{*ibmq-server*}/programs/{program-id}/private :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (204 t)
      (400 (json-to-clos body 'error-container))
      (401 (json-to-clos body 'error-container))
      (403 (json-to-clos body 'error-container))
      (404 (json-to-clos body 'error-container))
      (otherwise nil))))
