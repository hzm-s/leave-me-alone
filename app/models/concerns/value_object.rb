module ValueObject
  extend ActiveSupport::Concern

  class_methods do
    def vo_attrs(*attributes)
      class_eval %Q{
        def ==(other)
          other.instance_of?(self.class) &&
            #{attributes.map { |attr| "self.#{attr} == other.#{attr}" }.join(' &&') }
        end
      }
    end
  end
end
