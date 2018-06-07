require 'rails_helper'

describe RemindInterval do
  it do
    expect(RemindInterval.default).to eq(RemindInterval.from_minutes(30))
  end

  it do
    expect { RemindInterval.from_minutes(5) }.to_not raise_error
  end

  it do
    expect { RemindInterval.from_minutes(60) }.to_not raise_error
  end

  it do
    expect { RemindInterval.from_minutes(0) }.to raise_error(ArgumentError)
  end

  it do
    expect { RemindInterval.from_minutes(61) }.to raise_error(ArgumentError)
  end

  it do
    expect { RemindInterval.from_minutes('30') }.to_not raise_error
  end
end
