# frozen_string_literal: true

class Views::Pages::Modals < Views::Base
  include Phlex::Rails::Helpers::StylesheetLinkTag
  include Phlex::Rails::Helpers::JavascriptIncludeTag

  def view_template
    Layout(title: t("titles.pages.home")) do
      javascript_include_tag "prism", data: { turbo_track: "reload" }
      stylesheet_link_tag "prism", "data-turbo-track": "reload"
      main(id: "home", class: "container mt-4 d-flex flex-column justify-content-center gap-5") do
        h1(class: "fs-4 mb-3") { t("headings.pages.home") }
        div(class: "d-flex gap-3") do
          render Modal.new(id: "default-modal") do |modal|
            modal.parts do
              modal.header do
                p { t(".default-modal.header") }
              end

              modal.body do
                p { t(".default-modal.body") }
                pre do
                  code(class: "language-ruby") do
                    <<~RUBY
                      render Modal.new(id: "default-modal") do |modal|
                        modal.parts do
                          modal.header do
                            p { t(".default-modal.header") }
                          end

                          modal.body do
                            p { t(".default-modal.body") }
                          end

                          modal.footer do
                            p { t(".default-modal.footer") }
                          end
                        end
                      end
                    RUBY
                  end
                end
              end

              modal.footer do
                p { t(".default-modal.footer") }
              end
            end
          end

          button(class: "btn btn-primary", data: { bs: { toggle: "modal", target: "#default-modal" } }) {
            "default modal"
          }

          render Modal.new(id: "sm-modal", size: 'sm') do |modal|
            modal.parts do
              modal.header do
                p { t(".default-modal.header") }
              end

              modal.body do
                p { t(".default-modal.body") }
                pre do
                  code(class: "language-ruby") do
                    <<~RUBY
                      render Modal.new(id: "sm-modal", size: 'sm') do |modal|
                        modal.parts do
                          modal.header do
                            p { t(".default-modal.header") }
                          end

                          modal.body do
                            p { t(".default-modal.body") }
                          end

                          modal.footer do
                            p { t(".default-modal.footer") }
                          end
                        end
                      end
                    RUBY
                  end
                end
              end

              modal.footer do
                p { t(".default-modal.footer") }
              end
            end
          end

          button(class: "btn btn-primary", data: { bs: { toggle: "modal", target: "#sm-modal" } }) {
            "sm modal"
          }

          render Modal.new(id: "lg-modal", size: 'lg') do |modal|
            modal.parts do
              modal.header do
                p { t(".default-modal.header") }
              end

              modal.body do
                p { t(".default-modal.body") }
                pre do
                  code(class: "language-ruby") do
                    <<~RUBY
                      render Modal.new(id: "lg-modal", size: "lg") do |modal|
                        modal.parts do
                          modal.header do
                            p { t(".default-modal.header") }
                          end

                          modal.body do
                            p { t(".default-modal.body") }
                          end

                          modal.footer do
                            p { t(".default-modal.footer") }
                          end
                        end
                      end
                    RUBY
                  end
                end
              end

              modal.footer do
                p { t(".default-modal.footer") }
              end
            end
          end

          button(class: "btn btn-primary", data: { bs: { toggle: "modal", target: "#lg-modal" } }) {
            "lg modal"
          }

          render Modal.new(id: "xl-modal", size: "xl") do |modal|
            modal.parts do
              modal.header do
                p { t(".default-modal.header") }
              end

              modal.body do
                p { t(".default-modal.body") }
                pre do
                  code(class: "language-ruby") do
                    <<~RUBY
                      render Modal.new(id: "xl-modal", size: "xl") do |modal|
                        modal.parts do
                          modal.header do
                            p { t(".default-modal.header") }
                          end

                          modal.body do
                            p { t(".default-modal.body") }
                          end

                          modal.footer do
                            p { t(".default-modal.footer") }
                          end
                        end
                      end
                    RUBY
                  end
                end
              end

              modal.footer do
                p { t(".default-modal.footer") }
              end
            end
          end

          button(class: "btn btn-primary", data: { bs: { toggle: "modal", target: "#xl-modal" } }) {
            "xl modal"
          }

          render Modal.new(id: "dismissible-modal", dismissible: true) do |modal|
            modal.parts do
              modal.header do
                p { t(".dismissible-modal.header") }
              end

              modal.body do
                p { t(".dismissible-modal.body_html") }
                pre do
                  code(class: "language-ruby") do
                    <<~RUBY
                      render Modal.new(id: "dismissible-modal", dismissible: true) do |modal|
                        modal.parts do
                          modal.header do
                            p { t(".dismissible-modal.header") }
                          end

                          modal.body do
                            p { t(".dismissible-modal.body_html") }
                          end
                        end
                      end
                    RUBY
                  end
                end
              end

              modal.footer
            end
          end

          button(class: "btn btn-primary", data: { bs: { toggle: "modal", target: "#dismissible-modal" } }) {
            "dismissible modal"
          }

          render Modal.new(id: "static-backdrop-modal", static_backdrop: true) do |modal|
            modal.parts do
              modal.header do
                p { t(".static-backdrop-modal.header") }
              end

              modal.body do
                p { t(".static-backdrop-modal.body_html") }
                pre do
                  code(class: "language-ruby") do
                    <<~RUBY
                      render Modal.new(id: "static-backdrop-modal", static_backdrop: true) do |modal|
                        modal.parts do
                          modal.header do
                            p { t(".static-backdrop-modal.header") }
                          end

                          modal.body do
                            p { t(".static-backdrop-modal.body_html") }
                          end

                          modal.footer do
                            button(type: "button", class: "btn btn-secondary", data_bs_dismiss: "modal") do
                              t('buttons.modal.close')
                            end
                          end
                        end
                      end
                    RUBY
                  end
                end
              end

              modal.footer do
                button(type: "button", class: "btn btn-secondary", data_bs_dismiss: "modal") do
                  t('buttons.modal.close')
                end
              end
            end
          end

          button(class: "btn btn-primary", data: { bs: { toggle: "modal", target: "#static-backdrop-modal" } }) {
            "static backdrop modal"
          }
        end

        link_to(t("actions.back"), root_path, class: "btn btn-secondary")
      end
    end
  end
end
