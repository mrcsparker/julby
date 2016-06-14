require 'spec_helper'

describe Julby do
  it 'has a version number' do
    expect(Julby::VERSION).not_to be nil
  end

  it 'loads the base Julby class' do
    expect(Julby).to eq(Julby)
  end

  it 'can initialize Julia' do
    Julby.jl_init(julia_path)
    expect(Julby.jl_is_initialized).to eq(1)

    Julby.init(julia_path)
    expect(Julby.is_initialized?).to eq(true)

  end

  it 'can do a basic eval' do
    j = Julby.jl_eval_string("1 + 1")
    expect(Julby.jl_typeof_str(j).to_s).to eq("Int64")
    expect(Julby.jl_unbox_int64(j)).to eq(2)

    j = Julby.jl_eval_string("5 + 5")
    expect(Julby.jl_typeof_str(j).to_s).to eq("Int64")
    expect(Julby.jl_unbox_int64(j)).to eq(10)

    j = Julby.evaluate("1+1")
    expect(j).to eq(2)
  end

  it 'converts basic Julia types of Ruby types' do
    Julby.init(julia_path)

    j = Julby.evaluate("true")
    expect(j).to eq(true)

    j = Julby.evaluate("convert(Int8, 8)")
    expect(j).to eq(8)

    j = Julby.evaluate("convert(UInt8, 9)")
    expect(j).to eq(9)

    j = Julby.evaluate("convert(Int16, 16)")
    expect(j).to eq(16)

    j = Julby.evaluate("convert(UInt16, 17)")
    expect(j).to eq(17)

    j = Julby.evaluate("convert(Int32, 32)")
    expect(j).to eq(32)

    j = Julby.evaluate("convert(UInt32, 33)")
    expect(j).to eq(33)

    j = Julby.evaluate("convert(Int64, 64)")
    expect(j).to eq(64)

    j = Julby.evaluate("convert(UInt64, 65)")
    expect(j).to eq(65)

    j = Julby.evaluate("convert(Float32, 100)")
    expect(j).to eq(100.0)

    j = Julby.evaluate("convert(Float64, 200)")
    expect(j).to eq(200.0)
  end

  it 'converts basic Julia arrays to Ruby arrays' do
    j = Julby.evaluate("[1, 2, 3]")
    p j
  end
end
