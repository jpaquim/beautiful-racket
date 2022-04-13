#lang brag
bf-program : (bf-op | bf-loop)*
bf-op : ">" | "<" | "+" | "-" | "." | ","
bf-loop : "[" (bf-op | bf-loop)* "]"

; bf-loop    : "[" bf-program "]"

; bf-program : bf-exprs
; bf-exprs   : (bf-op | bf-loop)*
; bf-op      : ">" | "<" | "+" | "-" | "." | ","
; bf-loop    : "[" bf-exprs "]"
