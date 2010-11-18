require File.dirname(__FILE__) + '/../test_helper'
require 'kite_controller'

# Re-raise errors caught by the controller.
class KiteController; def rescue_action(e) raise e end; end

class KiteControllerTest < Test::Unit::TestCase
  def setup
    @controller = KiteController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
