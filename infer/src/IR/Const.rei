/*
 * vim: set ft=rust:
 * vim: set ft=reason:
 *
 * Copyright (c) 2009 - 2013 Monoidics ltd.
 * Copyright (c) 2013 - present Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

open! Utils;


/** The Smallfoot Intermediate Language: Constants */
let module L = Logging;

let module F = Format;


/** Constants */
type t =
  | Cint of IntLit.t /** integer constants */
  | Cfun of Procname.t /** function names */
  | Cstr of string /** string constants */
  | Cfloat of float /** float constants */
  | Cclass of Ident.name /** class constant */
  | Cptr_to_fld of Ident.fieldname Typ.t /** pointer to field constant,
                                             and type of the surrounding Csu.t type */;

let compare: t => t => int;

let equal: t => t => bool;


/** Return true if the constants have the same kind (both integers, ...) */
let kind_equal: t => t => bool;


/** Pretty print a const */
let pp: printenv => F.formatter => t => unit;

let to_string: t => string;
