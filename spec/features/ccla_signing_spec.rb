require 'spec_feature_helper'

describe 'signing a CCLA' do
  before { create(:ccla) }

  it 'establishes the signer as an admin of the organization' do
    sign_in_with_github
    sign_ccla
    click_link 'View Profile'
    expect(page).to have_content 'Admin of Chef'
  end

  def sign_ccla
    click_link 'Sign CCLA'

    fill_in 'ccla_signature_first_name', with: 'John'
    fill_in 'ccla_signature_last_name', with: 'Doe'
    fill_in 'ccla_signature_company', with: 'Chef'
    fill_in 'ccla_signature_email', with: 'john@example.com'
    fill_in 'ccla_signature_phone', with: '(555) 555-5555'
    fill_in 'ccla_signature_address_line_1', with: '1 Chef Way'
    fill_in 'ccla_signature_city', with: 'Seattle'
    fill_in 'ccla_signature_state', with: 'WA'
    fill_in 'ccla_signature_zip', with: '12345'
    fill_in 'ccla_signature_country', with: 'USA'

    find("label[for='ccla_signature_agreement']").click

    find_button('Sign CCLA').click
  end
end