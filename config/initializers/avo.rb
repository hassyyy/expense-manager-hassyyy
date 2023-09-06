# For more information regaring these settings check out our docs https://docs.avohq.io
Avo.configure do |config|
  ## == Routing ==
  config.root_path = '/avo'

  ## == Licensing ==
  config.license = 'community' # change this to 'pro' when you add the license key
  # config.license_key = ENV['AVO_LICENSE_KEY']

  ## == Set the context ==
  config.set_context do
    # Return a context object that gets evaluated in Avo::ApplicationController
  end

  ## == Authentication ==
  config.current_user_method do
    AvoUser = Struct.new(:name)
    AvoUser.new("Hassyyy's Expense Manager")
  end
  include ActionController::HttpAuthentication::Basic
  config.authenticate_with do
    username = ENV['EM_USERNAME'] || 'username'
    password = ENV['EM_PASSWORD'] || 'password'
    http_basic_authenticate_or_request_with name: username, password: password
  end

  ## == Authorization ==
  # config.authorization_methods = {
  #   index: 'index?',
  #   show: 'show?',
  #   edit: 'edit?',
  #   new: 'new?',
  #   update: 'update?',
  #   create: 'create?',
  #   destroy: 'destroy?',
  # }

  ## == Localization ==
  # config.locale = 'en-US'

  ## == Customization ==
  config.app_name = "Hassyyy's Expense Manager"
  # config.avo_title = 'Hassyyy'
  config.timezone = 'IST'
  # config.currency = 'USD'
  config.per_page = 30
  config.disabled_features = [:global_search]
  # config.per_page_steps = [12, 24, 48, 72]
  # config.via_per_page = 8
  # config.default_view_type = :table
  # config.id_links_to_resource = false
  # config.full_width_container = false
  # config.full_width_index_view = false
  config.cache_resources_on_index_view = false
  # config.search_debounce = 300
  # config.view_component_path = "app/components"
  # config.display_license_request_timeout_error = true
  config.buttons_on_form_footers = true

  config.main_menu = -> {
    dashboard :home_dashboard
    dashboard :monthly_expenses_dashboard
    dashboard :fuel_expenses_dashboard
    section "Banking", icon: "heroicons/solid/currency-rupee" do
      resource :balance
      resource :expense
      resource :transaction
      resource :credit_card
      resource :saving
      resource :loan
    end
    section "Others", icon: "heroicons/solid/view-grid" do
      resource :trip
    end
  }

  # Where should the user be redirected when he hits the `/avo` url
  config.home_path = '/avo/dashboards/home_dashboard'

  # https://tailwindcss.com/docs/customizing-colors - Blue
  config.branding = {
    colors: {
      background: "239 246 255",
      100 => "#dbeafe",
      400 => "#60a5fa",
      500 => "#3b82f6",
      600 => "#2563eb",
    },
    logo: "/assets/wallet.png",
    logomark: "/assets/wallet.png",
    favicon: "/assets/wallet.ico"
  }

  ## == Breadcrumbs ==
  # config.display_breadcrumbs = true
  # config.set_initial_breadcrumbs do
  #   add_breadcrumb "Home", '/avo'
  # end
end
