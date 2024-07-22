# frozen_string_literal: true

require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get sign_up_url
    assert_response :success
  end

  test 'should sign up' do
    assert_difference('User.count') do
      post sign_up_url,
           params: { email: 'kelson-eduardo@proton.me', password: 'root1234567890',
                     password_confirmation: 'root1234567890' }
    end

    assert_redirected_to root_url
  end
end
