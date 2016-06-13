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
  end
end
