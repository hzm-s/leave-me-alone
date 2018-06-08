module ValueObject
  extend ActiveSupport::Concern

  class_methods do
    def vo_attrs(*attributes)
      class_eval %Q{
        def same_value_as?(other)
          other.instance_of?(self.class) &&
            #{attributes.map { |attr| "self.#{attr} == other.#{attr}" }.join(' &&') }
        end
      }
    end
  end
end
