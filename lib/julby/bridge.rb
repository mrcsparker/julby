module Julby
  class Bridge
    def evaluate(s)
      j = Julby.jl_eval_string(s)
      convert_to_ruby(j)
    end

    private
    def type_of(j)
      Julby.jl_typeof_str(j)
    end

    def convert_to_ruby(j)
      case Julby.jl_typeof_str(j).to_s
      when "Bool"
        Julby.jl_unbox_bool(j) == 1
      when "Int8"
        Julby.jl_unbox_int8(j)
      when "UInt8"
        Julby.jl_unbox_uint8(j)
      when "Int16"
        Julby.jl_unbox_int16(j)
      when "UInt16"
        Julby.jl_unbox_uint16(j)
      when "Int32"
        Julby.jl_unbox_int32(j)
      when "UInt32"
        Julby.jl_unbox_uint32(j)
      when "Int64"
        Julby.jl_unbox_int64(j)
      when "UInt64"
        Julby.jl_unbox_uint64(j)
      when "Float32"
        Julby.jl_unbox_float32(j)
      when "Float64"
        Julby.jl_unbox_float64(j)
      when "Array"
        from_julia_array(j)
      else
        Julby.jl_typeof_str(j).to_s
      end
    end

    def from_julia_array(j)
      j
    end

  end
end
