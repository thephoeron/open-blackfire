;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :open-blackfire/quantum-cloud/ibm-quantum)

(defmethod list-devices ()
  "Returns a list of all the devices your service instance has access to."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:get #U{*ibmq-server*}/devices :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (200 (json-to-clos body 'devices-response))
      (otherwise nil))))

(defmethod get-device-properties (device-id)
  "Returns the properties for the specified device."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:get #U{*ibmq-server*}/devices/{device-id}/properties :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (200 (json-to-clos body 'device-properties-response))
      (otherwise nil))))

(defmethod get-device-configuration (device-id)
  "Returns the configuration for the specified device."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:get #U{*ibmq-server*}/devices/{device-id}/configuration :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (200 (json-to-clos body 'device-configuration-response))
      (otherwise nil))))

(defmethod get-device-status (device-id)
  "Returns the status for the specified device ID."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:get #U{*ibmq-server*}/devices/{device-id}/status :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (200 (json-to-clos body 'device-status-response))
      (otherwise nil))))

(defmethod get-device-defaults (device-id)
  "Returns the defaults for the specified device."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:get #U{*ibmq-server*}/devices/{device-id}/defaults :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (200 (json-to-clos body 'device-defaults-response))
      (otherwise nil))))
