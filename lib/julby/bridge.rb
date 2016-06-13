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
      case Julby.jl_typeof_str(j)
      when "Bool"
        Julby.jl_unbox_bool(j) == 1
      when "Int8"
        Julby.jl_unbox_int8(j)
      when "Int32"
        Julby.jl_unbox_int32(j)
      when "Int64"
        Julby.jl_unbox_int64(j)
      else
        Julby.jl_typeof_str(j)
      end
    end
  end
end
