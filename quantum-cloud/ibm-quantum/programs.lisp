;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :open-blackfire/quantum-cloud/ibm-quantum)

(defmethod create-program ()
  "Upload a new quantum program."
  (dex:post #U{*ibmq-server*}/programs :headers (list (cons "x-access-token" *ibmq-api-key*))))

(defmethod list-programs ()
  "Returns a list of all programs you uploaded and all public programs."
  (dex:get #U{*ibmq-server*}/programs :headers (list (cons "x-access-token" *ibmq-api-key*))))

(defmethod get-program (program-id)
  "Return information about the specified program."
  (dex:get #U{*ibmq-server*}/programs/{program-id} :headers (list (cons "x-access-token" *ibmq-api-key*))))

(defmethod delete-program (program-id)
  "Delete the specified program."
  (dex:delete #U{*ibmq-server*}/programs/{program-id} :headers (list (cons "x-access-token" *ibmq-api-key*))))

(defmethod update-program (program-id)
  "Update the name, cost, description, or add more backend requirements, parameters, return values, and results.  To update the actual program data, use the PUT enpoint instead."
  (dex:patch #U{*ibmq-server*}/programs/{program-id} :headers (list (cons "x-access-token" *ibmq-api-key*))))

(defmethod update-program-data (program-id)
  "Update the program data for the specified program. To update or add metadata, use the Patch endpoint instead."
  (dex:put #U{*ibmq-server*}/programs/{program-id}/data :headers (list (cons "x-access-token" *ibmq-api-key*))))

(defmethod set-program-public (program-id)
  "Make a program that you uploaded publicly available. Others will be able to view and run the program, but only you will be able to edit it."
  (dex:put #U{*ibmq-server*}/programs/{program-id}/public :headers (list (cons "x-access-token" *ibmq-api-key*))))

(defmethod set-program-private (program-id)
  "Make a program private. You can only make a program private if you uploaded it."
  (dex:put #U{*ibmq-server*}/programs/{program-id}/private :headers (list (cons "x-access-token" *ibmq-api-key*))))
