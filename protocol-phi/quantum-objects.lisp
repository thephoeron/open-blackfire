;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :open-blackfire/protocol-phi)

(defclass blackfire-class (standard-class)
  ())

(defmethod validate-superclass ((class blackfire-class) (superclass standard-class))
  t)

(defclass blackfire-object (standard-object)
  ()
  (:metaclass blackfire-class))

(defclass quantum-object (blackfire-object)
  ()
  (:metaclass blackfire-class))

(defclass quantum-state (quantum-object)
  ()
  (:metaclass blackfire-class))

(defclass quantum-state-space (quantum-object)
  ((states)
   (index))
  (:metaclass blackfire-class))

(defclass quantum-operator (quantum-object)
  ()
  (:metaclass blackfire-class))

(defclass quantum-operation (quantum-object)
  ((operator :type quantum-operator)
   (arguments :type (vector quantum-state *)))
  (:metaclass blackfire-class))

(defclass quantum-system (quantum-object)
  ((state-space :type quantum-state-space)
   (operations :type (vector quantum-operation *)))
  (:metaclass blackfire-class))
