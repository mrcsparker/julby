require "julby/version"
require 'ffi'

module Julby
  extend FFI::Library

  ffi_lib_flags(:global, :now)

  if ENV['JULIA_DYLIB']
    ffi_lib ENV['JULIA_DYLIB']
  else
    ffi_lib 'julia'
  end

  # basic predicates
  attach_function :jl_typeof_str, [:pointer], :string

  # object identity

  # type predicates and basic operations

  # type constructors

  # constructors

  # DLLEXPORT jl_value_t *jl_box_bool(int8_t x);
  attach_function :jl_box_bool, [:int8_t], :pointer
  # DLLEXPORT jl_value_t *jl_box_int8(int8_t x);
  attach_function :jl_box_int8, [:int8_t], :pointer
  # DLLEXPORT jl_value_t *jl_box_uint8(uint8_t x);
  attach_function :jl_box_uint8, [:uint8_t], :pointer
  # DLLEXPORT jl_value_t *jl_box_int16(int16_t x);
  attach_function :jl_box_int16, [:int16_t], :pointer
  # DLLEXPORT jl_value_t *jl_box_uint16(uint16_t x);
  attach_function :jl_box_uint16, [:uint16_t], :pointer
  # DLLEXPORT jl_value_t *jl_box_int32(int32_t x);
  attach_function :jl_box_int32, [:int32_t], :pointer
  # DLLEXPORT jl_value_t *jl_box_uint32(uint32_t x);
  attach_function :jl_box_uint32, [:uint32_t], :pointer
  # DLLEXPORT jl_value_t *jl_box_char(uint32_t x);
  attach_function :jl_box_char, [:uint32_t], :pointer
  # DLLEXPORT jl_value_t *jl_box_int64(int64_t x);
  attach_function :jl_box_int64, [:int64_t], :pointer
  # DLLEXPORT jl_value_t *jl_box_uint64(uint64_t x);
  attach_function :jl_box_uint64, [:uint64_t], :pointer
  # DLLEXPORT jl_value_t *jl_box_float32(float x);
  attach_function :jl_box_float32, [:float], :pointer
  # DLLEXPORT jl_value_t *jl_box_float64(double x);
  attach_function :jl_box_float64, [:double], :pointer
  # DLLEXPORT jl_value_t *jl_box_voidpointer(void *x);
  attach_function :jl_box_voidpointer, [:pointer], :pointer
  # DLLEXPORT jl_value_t *jl_box_gensym(size_t x);
  attach_function :jl_box_gensym, [:size_t], :pointer
  # DLLEXPORT jl_value_t *jl_box8 (jl_datatype_t *t, int8_t  x);
  attach_function :jl_box8, [:pointer, :int8_t], :pointer
  # DLLEXPORT jl_value_t *jl_box16(jl_datatype_t *t, int16_t x);
  attach_function :jl_box16, [:pointer, :int16_t], :pointer
  # DLLEXPORT jl_value_t *jl_box32(jl_datatype_t *t, int32_t x);
  attach_function :jl_box32, [:pointer, :int32_t], :pointer
  # DLLEXPORT jl_value_t *jl_box64(jl_datatype_t *t, int64_t x);
  attach_function :jl_unbox_bool, [:pointer, :int64_t], :pointer
  # DLLEXPORT int8_t jl_unbox_bool(jl_value_t *v);
  attach_function :jl_unbox_bool, [:pointer], :int8_t
  # DLLEXPORT int8_t jl_unbox_int8(jl_value_t *v);
  attach_function :jl_unbox_int8, [:pointer], :int8_t
  # DLLEXPORT uint8_t jl_unbox_uint8(jl_value_t *v);
  attach_function :jl_unbox_uint8, [:pointer], :uint8_t
  # DLLEXPORT int16_t jl_unbox_int16(jl_value_t *v);
  attach_function :jl_unbox_int16, [:pointer], :int16_t
  # DLLEXPORT uint16_t jl_unbox_uint16(jl_value_t *v);
  attach_function :jl_unbox_uint16, [:pointer], :uint16_t
  # DLLEXPORT int32_t jl_unbox_int32(jl_value_t *v);
  attach_function :jl_unbox_int32, [:pointer], :int32_t
  # DLLEXPORT uint32_t jl_unbox_uint32(jl_value_t *v);
  attach_function :jl_unbox_uint32, [:pointer], :uint32_t
  # DLLEXPORT int64_t jl_unbox_int64(jl_value_t *v);
  attach_function :jl_unbox_int64, [:pointer], :int64_t
  # DLLEXPORT uint64_t jl_unbox_uint64(jl_value_t *v);
  attach_function :jl_unbox_uint64, [:pointer], :uint64_t
  # DLLEXPORT float jl_unbox_float32(jl_value_t *v);
  attach_function :jl_unbox_float32, [:pointer], :float
  # DLLEXPORT double jl_unbox_float64(jl_value_t *v);
  attach_function :jl_unbox_float64, [:pointer], :double
  # DLLEXPORT void *jl_unbox_voidpointer(jl_value_t *v);
  attach_function :jl_unbox_voidpointer, [:pointer], :void
  # DLLEXPORT ssize_t jl_unbox_gensym(jl_value_t *v);
  attach_function :jl_unbox_gensym, [:pointer], :ssize_t

  # DLLEXPORT int jl_get_size(jl_value_t *val, size_t *pnt);
  attach_function :jl_get_size, [:pointer,:pointer], :int

  # structs

  # strings

  # modules and global variables

  # throwing common exceptions

  # DLLEXPORT void NORETURN jl_error(const char *str);
  attach_function :jl_error, [:string], :void
  # DLLEXPORT void NORETURN jl_errorf(const char *fmt, ...);
  # DLLEXPORT void NORETURN jl_exceptionf(jl_datatype_t *ty, const char *fmt, ...);
  # DLLEXPORT void NORETURN jl_too_few_args(const char *fname, int min);
  # DLLEXPORT void NORETURN jl_too_many_args(const char *fname, int max);
  # DLLEXPORT void NORETURN jl_type_error(const char *fname, jl_value_t *expected, jl_value_t *got);
  # DLLEXPORT void NORETURN jl_type_error_rt(const char *fname, const char *context, jl_value_t *ty, jl_value_t *got);
  # DLLEXPORT void NORETURN jl_undefined_var_error(jl_sym_t *var);
  # DLLEXPORT void NORETURN jl_bounds_error(jl_value_t *v, jl_value_t *t);
  # DLLEXPORT void NORETURN jl_bounds_error_v(jl_value_t *v, jl_value_t **idxs, size_t nidxs);
  # DLLEXPORT void NORETURN jl_bounds_error_int(jl_value_t *v, size_t i);
  # DLLEXPORT void NORETURN jl_bounds_error_tuple_int(jl_value_t **v, size_t nv, size_t i);
  # DLLEXPORT void NORETURN jl_bounds_error_unboxed_int(void *v, jl_value_t *vt, size_t i);
  # DLLEXPORT void NORETURN jl_bounds_error_ints(jl_value_t *v, size_t *idxs, size_t nidxs);
  # DLLEXPORT jl_value_t *jl_exception_occurred(void);
  attach_function :jl_exception_occurred, [], :pointer
  # DLLEXPORT void jl_exception_clear(void);

  # initialization functions
  attach_function :jl_init, [:pointer], :void
  attach_function :jl_init_with_image, [:pointer, :pointer], :void
  attach_function :jl_is_initialized, [], :int

  # front end interface
  attach_function :jl_parse_input_line, [:pointer, :size_t], :pointer
  attach_function :jl_parse_string, [:pointer, :size_t, :int, :int ], :pointer
  attach_function :jl_parse_depwarn, [:int], :int
  attach_function :jl_load_file_string, [:pointer, :size_t, :pointer, :size_t], :pointer
  attach_function :jl_expand, [:pointer], :pointer
  #attach_function :jl_expand_in, [:pointer, :pointer], :pointer
  attach_function :jl_eval_string, [:pointer], :pointer

  # ast access
end
