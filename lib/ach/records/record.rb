module ACH
  module Records
    class Record
      @fields = []
      
      class << self
        def fields
          @fields
        end
      end
      
      extend(FieldIdentifiers)
      
      attr_accessor :case_sensitive
      
      def to_ach
        to_ach = self.class.fields.collect { |f| send("#{f}_to_ach") }.join('')
        case_sensitive ? to_ach : to_ach.upcase
      end
    end
  end
end
