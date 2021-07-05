require 'test_helper'
require 'players_helper'

class PlayersHelperTest < ActiveSupport::TestCase
    include PlayersHelper
    
    def test_parse_out_integer
        assert_equal 123, parse_out_integer(123)
        assert_equal 123, parse_out_integer("123")
        assert_equal 1230, parse_out_integer("1,230")
        assert_equal 123, parse_out_integer("123T")
        assert_equal 1, parse_out_integer(1.3)
        assert_equal 0, parse_out_integer(nil)
    end
    def test_parse_out_decimal
        assert_equal 123.0, parse_out_decimal(123) 
        assert_equal 123.4, parse_out_decimal("123.4") 
        assert_equal 1230.4, parse_out_decimal("1,230.4")
        assert_equal 123.0, parse_out_decimal("123T")
        assert_equal 1.3, parse_out_decimal(1.3)
        assert_equal 0.0, parse_out_decimal(nil)
    end
    def test_parse_out_t
        assert_equal "", parse_out_t(nil)
        assert_equal "T", parse_out_t("123T")
        assert_equal "", parse_out_t(123)
    end
    
    
end