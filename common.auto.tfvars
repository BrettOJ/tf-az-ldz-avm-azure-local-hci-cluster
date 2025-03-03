location   = "southeastasia"
suffix_001 = ["test", "d", "azhci", "001"]
suffix_002 = ["test", "d", "azhci", "002"]

country            = "Singapore"
site_display_name  = "TST-SG-ARC-DC"
site_resource_name = "tst-sg-arc-dc"

# auto.tfvars file for the example module

end_date      = "2025-04-12T00:00:00Z"
start_date    = "2025-02-12T00:00:00Z"
rotation_days = 30

# Application registration values

description                            = "correct-description"
display_name                           = "correct-display-name"
group_membership_claims                = "correct-group-membership-claims"
homepage_url                           = "https://correct-homepage-url"
implicit_access_token_issuance_enabled = true
implicit_id_token_issuance_enabled     = true
logout_url                             = "https://correct-logout-url"
marketing_url                          = "https://correct-marketing-url"
notes                                  = "correct-notes"
privacy_statement_url                  = "https://correct-privacy-statement-url"
requested_access_token_version         = 2
service_management_reference           = "correct-service-management-reference"
sign_in_audience                       = "AzureADMyOrg"
support_url                            = "https://correct-support-url"
terms_of_service_url                   = "https://correct-terms-of-service-url"

# values for the azuread_service_principal module

account_enabled              = true
alternative_names            = ["alt-name1", "alt-name2"]
app_role_assignment_required = false

feature_tags_custom_single_sign_on = true
feature_tags_enterprise            = true
feature_tags_gallery               = true
feature_tags_hide                  = true

login_url                       = "https://login-url"
notification_email_addresses    = ["email1@example.com", "email2@example.com"]
preferred_single_sign_on_mode   = "oidc"
saml_single_sign_on_relay_state = "relay-state"


# Key Vault key values

not_before_date = "2025-02-12T00:00:00Z"
expiration_date = "2025-04-12T00:00:00Z"

