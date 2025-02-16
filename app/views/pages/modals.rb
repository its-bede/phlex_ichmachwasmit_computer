# frozen_string_literal: true

class Views::Pages::Modals < Views::Base
  def view_template
    Layout(title: t("titles.pages.home")) do
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
              end

              modal.footer do
                p { t(".default-modal.footer") }
              end
            end
          end

          button(class: "btn btn-primary", data: { bs: { toggle: "modal", target: "#default-modal" } }) {
            "launch modal"
          }
        end

        link_to(t("actions.back"), root_path, class: "btn btn-secondary")
      end
    end
  end
end
