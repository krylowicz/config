;; extends

(import_statement
  name: (dotted_name 
    (identifier) @import
  ) @import_module
  (#set! priority 110)
)

(import_statement
  name: (aliased_import
    name: (dotted_name
      (identifier) @import
    ) @import_module
    (#set! priority 110)
    alias: (identifier) @import
  )
)

(import_from_statement
  module_name: (dotted_name
    (identifier) @import
  ) @import_module
  (#set! priority 110)
  name: (dotted_name
    (identifier) @import
  )
)

(import_from_statement
  name: (aliased_import
    name: (dotted_name
      (identifier) @import
    ) @import_module
    (#set! priority 110)
    alias: (identifier) @import
  )
)

(import_from_statement
  module_name: (dotted_name
    (identifier) @import
  ) @import_module
  (#set! priority 110)
  name: (aliased_import
    name: (dotted_name
      (identifier) @import
    ) @import_module
    (#set! priority 110)
    alias: (identifier) @import
  )
)

(future_import_statement
  name: (dotted_name
    (identifier) @import
  )
)

(decorated_definition
  (decorator) @decorator
  (#set! priority 110)
)

(
  (identifier) @private_constant
  (#match? @private_constant "^_([A-Z]+)")
)
