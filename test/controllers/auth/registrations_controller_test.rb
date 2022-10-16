# frozen_string_literal: true

require 'test_helper'

# rubocop:disable Metrics/MethodLength
module Auth
  # Test devise signups
  class RegistrationsControllerTest < ActionDispatch::IntegrationTest
    def test_get_new
      get new_user_registration_path

      assert_response :success

      assert_select "form[action='#{user_registration_path}']" do
        assert_select "input[name='user[email]']"
        assert_select "input[name='user[password]']"
        assert_select "input[name='user[password_confirmation]']"
        assert_select 'input[type=submit]'
      end
    end

    def test_post_create
      email = 'newuser@test.com'

      assert_difference('User.count', 1) do
        post user_registration_path(
          params: {
            user: {
              email: email,
              password: 'temp1234',
              password_confirmation: 'temp1234'
            }
          }
        )
      end

      assert_equal email, User.last.email

      assert_redirected_to root_path
      follow_redirect!
      assert_response :success
    end

    def test_post_create_invalid
      assert_difference('User.count', 0) do
        post user_registration_path(
          params: {
            user: {
              email: 'newuser@test.com',
              password: 'temp1234',
              password_confirmation: 'nope'
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
