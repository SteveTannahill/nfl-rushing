module PlayersHelper
    def parse_out_integer value
        case 
        when value.is_a?(String)
            value.tr(',', '').to_i 
        when value.is_a?(Numeric)
            value.to_i
        else
            0
        end
    end

    def parse_out_decimal value
        case
        when value.is_a?(String)
            value.tr(',', '').to_f 
        when value.is_a?(Numeric)
            value.to_f
        else
            0.0
        end
    end

    def parse_out_t value
        value.is_a?(String) && value.include?("T") ? "T" : ""
    end
    
end
