# frozen_string_literal: true

class Views::Pages::Cards < Views::Base
  def view_template
    Layout(title: t("titles.pages.home")) do
      main(id: "home", class: "container mt-4 d-flex flex-column justify-content-center gap-5") do
        h1(class: "fs-4 mb-0") { t("headings.pages.home.cards") }
        h2(class: "fs-5 mb-2") { t("sub_headings.pages.cards") }
        div(class: "d-flex gap-3") do
          render Card.new do |card|
            card.body { t('descriptions.pages.cards.with-body-only') }
          end

          render Card.new do |card|
            card.header { t("descriptions.pages.cards.card-header") }
            card.body { t('descriptions.pages.cards.with-header-body') }
          end

          render Card.new(title: t("descriptions.pages.cards.title")) do |card|
            card.header { t("descriptions.pages.cards.card-header") }
            card.body { t("descriptions.pages.cards.with-header-body-and-title") }
          end

          render Card.new do |card|
            card.header { t("descriptions.pages.cards.card-header") }
            card.body { t("descriptions.pages.cards.with-header-body-and-footer") }
            card.footer { t("descriptions.pages.cards.card-footer") }
          end
        end

        link_to(t("actions.back"), root_path, class: "btn btn-secondary")
      end
    end
  end
end
