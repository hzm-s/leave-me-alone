require 'rails_helper'

describe Todo do
  it do
    expect { Todo.new('A') }.to_not raise_error
  end

  it do
    expect { Todo.new('A' * 30) }.to_not raise_error
  end

  it do
    expect { Todo.new('') }.to raise_error do |e|
      expect(e.i18n_key).to eq(:too_short)
      expect(e.i18n_options[:count]).to eq(1)
    end
  end

  it do
    expect { Todo.new('A' * 31) }.to raise_error do |e|
      expect(e.i18n_key).to eq(:too_long)
      expect(e.i18n_options[:count]).to eq(30)
    end
  end
end
