require "julby/version"

require 'julby/bridge'

require 'fiddle'
require 'fiddle/import'


module Julby
  extend Fiddle::Importer

  if ENV['JULIA_DYLIB']
    dlload ENV['JULIA_DYLIB']
  else
    dlload 'julia'
  end

  # // basic predicates

  # JL_DLLEXPORT const char *jl_typeof_str(jl_value_t *v);
  extern 'const char *jl_typeof_str(jl_value_t *v)'

  # // object identity

  # // type predicates and basic operations

  # // type constructors

  # // constructors

  # DLLEXPORT jl_value_t *jl_box_bool(int8_t x);
  extern 'jl_value_t *jl_box_bool(int)'
  # DLLEXPORT jl_value_t *jl_box_int8(int8_t x);
  extern 'jl_value_t *jl_box_int8(int)'
  # DLLEXPORT jl_value_t *jl_box_uint8(uint8_t x);
  extern 'jl_value_t *jl_box_uint8(uint)'
  # DLLEXPORT jl_value_t *jl_box_int16(int16_t x);
  extern 'jl_value_t *jl_box_int16(int)'
  # DLLEXPORT jl_value_t *jl_box_uint16(uint16_t x);
  extern 'jl_value_t *jl_box_uint16(uint)'
  # DLLEXPORT jl_value_t *jl_box_int32(int32_t x);
  extern 'jl_value_t *jl_box_int32(int)'
  # DLLEXPORT jl_value_t *jl_box_uint32(uint32_t x);
  extern 'jl_value_t *jl_box_uint32(uint)'
  # DLLEXPORT jl_value_t *jl_box_char(uint32_t x);
  extern 'jl_value_t *jl_box_char(uint)'
  # DLLEXPORT jl_value_t *jl_box_int64(int64_t x);
  extern 'jl_value_t *jl_box_int64(int)'
  # DLLEXPORT jl_value_t *jl_box_uint64(uint64_t x);
  extern 'jl_value_t *jl_box_uint64(uint)'
  # DLLEXPORT jl_value_t *jl_box_float32(float x);
  extern 'jl_value_t *jl_box_float32(float)'
  # DLLEXPORT jl_value_t *jl_box_float64(double x);
  extern 'jl_value_t *jl_box_float64(double)'
  # DLLEXPORT jl_value_t *jl_box_voidpointer(void *x);
  extern 'jl_value_t *jl_box_voidpointer(void *x)'
  # DLLEXPORT jl_value_t *jl_box_gensym(size_t x);
  extern 'jl_value_t *jl_box_gensym(size_t)'
  # DLLEXPORT jl_value_t *jl_box8 (jl_datatype_t *t, int8_t  x);
  extern 'jl_value_t *jl_box8 (jl_datatype_t *t, int)'
  # DLLEXPORT jl_value_t *jl_box16(jl_datatype_t *t, int16_t x);
  extern 'jl_value_t *jl_box16(jl_datatype_t *t, int)'
  # DLLEXPORT jl_value_t *jl_box32(jl_datatype_t *t, int32_t x);
  extern 'jl_value_t *jl_box32(jl_datatype_t *t, int)'
  # DLLEXPORT jl_value_t *jl_box64(jl_datatype_t *t, int64_t x);
  extern 'jl_value_t *jl_box64(jl_datatype_t *t, int)'

  # DLLEXPORT int8_t jl_unbox_bool(jl_value_t *v);
  extern 'int jl_unbox_bool(jl_value_t *v)'
  # DLLEXPORT int8_t jl_unbox_int8(jl_value_t *v);
  extern 'int jl_unbox_int8(jl_value_t *v)'
  # DLLEXPORT uint8_t jl_unbox_uint8(jl_value_t *v);
  extern 'uint jl_unbox_uint8(jl_value_t *v)'
  # DLLEXPORT int16_t jl_unbox_int16(jl_value_t *v);
  extern 'int jl_unbox_int16(jl_value_t *v)'
  # DLLEXPORT uint16_t jl_unbox_uint16(jl_value_t *v);
  extern 'uint jl_unbox_uint16(jl_value_t *v)'
  # DLLEXPORT int32_t jl_unbox_int32(jl_value_t *v);
  extern 'int jl_unbox_int32(jl_value_t *v)'
  # DLLEXPORT uint32_t jl_unbox_uint32(jl_value_t *v);
  extern 'uint jl_unbox_uint32(jl_value_t *v)'
  # DLLEXPORT int64_t jl_unbox_int64(jl_value_t *v);
  extern 'int jl_unbox_int64(jl_value_t *v)'
  # DLLEXPORT uint64_t jl_unbox_uint64(jl_value_t *v);
  extern 'uint jl_unbox_uint64(jl_value_t *v)'
  # DLLEXPORT float jl_unbox_float32(jl_value_t *v);
  extern 'float jl_unbox_float32(jl_value_t *v)'
  # DLLEXPORT double jl_unbox_float64(jl_value_t *v);
  extern 'double jl_unbox_float64(jl_value_t *v)'

  # DLLEXPORT void *jl_unbox_voidpointer(jl_value_t *v);
  extern 'void *jl_unbox_voidpointer(jl_value_t *v)'
  # DLLEXPORT ssize_t jl_unbox_gensym(jl_value_t *v);
  extern 'ssize_t jl_unbox_gensym(jl_value_t *v)'

  # DLLEXPORT int jl_get_size(jl_value_t *val, size_t *pnt);
  extern 'int jl_get_size(jl_value_t *val, size_t *pnt)'

  # // structs

  # // strings

  # // modules and global variables

  # // throwing common exceptions

  # DLLEXPORT void NORETURN jl_error(const char *str);
  extern 'void jl_error(const char *)'
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
  extern 'jl_value_t *jl_exception_occurred(void)'
  # DLLEXPORT void jl_exception_clear(void);

  # // initialization functions

  # JL_DLLEXPORT void julia_init(JL_IMAGE_SEARCH rel);
  # JL_DLLEXPORT void jl_init(const char *julia_home_dir);
  extern 'void jl_init(const char *)'
  # JL_DLLEXPORT void jl_init_with_image(const char *julia_home_dir,
  #                                      const char *image_relative_path);
  extern 'void jl_init_with_image(const char *, const char *)'

  # JL_DLLEXPORT int jl_is_initialized(void);
  extern 'int jl_is_initialized(void)'
  # JL_DLLEXPORT void jl_atexit_hook(int status);
  extern 'void jl_atexit_hook(int status)'
  # JL_DLLEXPORT void JL_NORETURN jl_exit(int status);
  extern 'void jl_exit(int status)'

  # JL_DLLEXPORT int jl_deserialize_verify_header(ios_t *s);
  # JL_DLLEXPORT void jl_preload_sysimg_so(const char *fname);
  # JL_DLLEXPORT ios_t *jl_create_system_image(void);
  # JL_DLLEXPORT void jl_save_system_image(const char *fname);
  # JL_DLLEXPORT void jl_restore_system_image(const char *fname);
  # JL_DLLEXPORT void jl_restore_system_image_data(const char *buf, size_t len);
  # JL_DLLEXPORT int jl_save_incremental(const char *fname, jl_array_t *worklist);
  # JL_DLLEXPORT jl_value_t *jl_restore_incremental(const char *fname);
  # JL_DLLEXPORT jl_value_t *jl_restore_incremental_from_buf(const char *buf, size_t sz);

  # // front end interface

  # JL_DLLEXPORT jl_value_t *jl_parse_input_line(const char *str, size_t len,
  #                                              const char *filename, size_t filename_len);
  #attach_function :jl_parse_input_line, [:pointer, :size_t], :pointer
  # JL_DLLEXPORT jl_value_t *jl_parse_string(const char *str, size_t len,
  #                                          int pos0, int greedy);
  #attach_function :jl_parse_string, [:pointer, :size_t, :int, :int ], :pointer
  # JL_DLLEXPORT int jl_parse_depwarn(int warn);
  #attach_function :jl_parse_depwarn, [:int], :int
  # JL_DLLEXPORT jl_value_t *jl_load_file_string(const char *text, size_t len,
  #                                              char *filename, size_t namelen);
  #attach_function :jl_load_file_string, [:pointer, :size_t, :pointer, :size_t], :pointer
  # JL_DLLEXPORT jl_value_t *jl_expand(jl_value_t *expr);
  #attach_function :jl_expand, [:pointer], :pointer
  # JL_DLLEXPORT jl_value_t *jl_expand(jl_value_t *expr);
  # JL_DLLEXPORT jl_value_t *jl_eval_string(const char *str);
  extern 'jl_value_t *jl_eval_string(const char *str)'

  # // external libraries

  # // compiler

  # // tracing

  # // AST access

  # // calling into julia

  # // interfacing with Task runtime

  # // async signal handling

  # // tasks and exceptions

  # // info describing an exception handler

  # // I/O system

  # // showing and std streams

  # // julia options

  # // Version information

  # JL_DLLEXPORT extern int jl_ver_major(void);
  #attach_function :jl_ver_major, [:void], :int
  # JL_DLLEXPORT extern int jl_ver_minor(void);
  #attach_function :jl_ver_minor, [:void], :int
  # JL_DLLEXPORT extern int jl_ver_patch(void);
  #attach_function :jl_ver_patch, [:void], :int
  # JL_DLLEXPORT extern int jl_ver_is_release(void);
  #attach_function :jl_ver_is_release, [:void], :int
  # JL_DLLEXPORT extern const char *jl_ver_string(void);
  #attach_function :jl_ver_string, [:void], :string
  # JL_DLLEXPORT const char *jl_git_branch(void);
  #attach_function :jl_git_branch, [:void], :string
  # JL_DLLEXPORT const char *jl_git_commit(void);
  #attach_function :jl_git_commit, [:void], :string

  def self.init(path)
    Julby.jl_init(path)
  end

  def self.is_initialized?
    Julby.jl_is_initialized == 1
  end

  def self.evaluate(s)
    b = Julby::Bridge.new
    b.evaluate(s)
  end
end
