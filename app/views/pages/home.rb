# frozen_string_literal: true

class Views::Pages::Home < Views::Base
  include Phlex::Rails::Helpers::FormTag

  def view_template
    Layout(title: t("titles.pages.home")) do
      main(id: "home", class: "container mt-4 d-flex flex-column align-items-center") do
        h1(class: "fs-4 my-5") { t("headings.pages.home") }
        div(class: "row") do
          div(class: "col-3") do
            article(class: "h-100 d-flex flex-column gap-1") do
              h2(class: "fs-6") { t("sub_headings.pages.home.cards") }
              p(class: "flex-grow-1") do
                t("articles.pages.home.card")
              end

              link_to(t("sub_headings.pages.home.cards"), cards_path, class: "btn btn-primary btn-sm")
            end
          end

          div(class: "col-3") do
            article(class: "h-100 d-flex flex-column gap-1") do
              h2(class: "fs-6") { t("sub_headings.pages.home.modals") }
              p(class: "flex-grow-1") do
                t("articles.pages.home.modal")
              end

              link_to(t("sub_headings.pages.home.modals"), modals_path, class: "btn btn-primary btn-sm")
            end
          end
        end
      end
    end
  end
end
