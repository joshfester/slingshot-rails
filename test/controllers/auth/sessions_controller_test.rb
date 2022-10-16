# frozen_string_literal: true

require 'test_helper'

# rubocop:disable Metrics/MethodLength
module Auth
  # Test devise logins
  class SessionsControllerTest < ActionDispatch::IntegrationTest
    def test_get_new
      get new_user_session_path

      assert_response :success

      assert_select "form[action='#{new_user_session_path}']" do
        assert_select "input[name='user[email]']"
        assert_select "input[name='user[password]']"
        assert_select '[type=submit]'
      end
    end

    def test_post_create
      user = FactoryBot.create :user

      assert_difference('User.count', 0) do
        post new_user_session_path(
          params: {
            user: {
              email: user.email,
              password: user.password
            }
          }
        )
      end

      assert_redirected_to root_path
      follow_redirect!
      assert_response :success
    end

    def test_post_create_invalid
      user = FactoryBot.create :user, {
        password: 'thepassword'
      }

      assert_difference('User.count', 0) do
        post new_user_session_path(
          params: {
            user: {
              email: user.email,
              password: 'notthepassword'
            }
          }
        )
      end

      assert_response :success
      assert_select '.alert-danger', 1
    end
  end
end
# rubocop:enable Metrics/MethodLength
