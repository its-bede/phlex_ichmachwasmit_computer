# frozen_string_literal: true

class Components::Layout < Components::Base
  include Phlex::Rails::Helpers::CSRFMetaTags
  include Phlex::Rails::Helpers::CSPMetaTag
  include Phlex::Rails::Helpers::StylesheetLinkTag
  include Phlex::Rails::Helpers::JavascriptIncludeTag

  def initialize(title:)
    @title = title
  end

  def view_template
    doctype

    html do
      head do
        title { @title }
        meta(charset: "utf-8")
        meta(viewport: "width=device-width, initial-scale=1.0")
        meta(apple_mobile_web_app_capable: "yes")
        meta(mobile_web_app_capable: "yes")
        csrf_meta_tags
        csp_meta_tag

        stylesheet_link_tag :app, data: { turbo_track: "reload" }
        javascript_include_tag "application", data: { turbo_track: "reload" }, type: "module"
        stylesheet_link_tag "application", "data-turbo-track": "reload"
      end

      body(class: "vh-100 d-flex justify-content-center") { yield }
    end
  end
end
