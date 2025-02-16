# frozen_string_literal: true

class Components::Modal < Components::Base
  DATA_ATTRIBUTE_FEATURES = {
    static_backdrop: { backdrop: "static", keyboard: "false" }
  }

  UTILITY_CLASS_FEATURES = {
    scrollable: "modal-dialog-scrollable",
    vertically_centered: "modal-dialog-centered",
    fullscreen: {
      "always" => "modal-fullscreen",
      "sm-down" => "modal-fullscreen-sm-down",
      "md-down" => "modal-fullscreen-md-down",
      "lg-down" => "modal-fullscreen-lg-down",
      "xl-down" => "modal-fullscreen-xl-down",
      "xxl-down" => "modal-fullscreen-xxl-down"
    }
  }

  # make sure to match them with your configured BS breakpoints / screen sizes
  SIZES = %w[sm lg xl].freeze

  def initialize(options = {})
    @id = options.delete(:id).presence || ""
    @dismissible = options.delete(:dismissible).presence || false
    default_class_names
    default_dialog_classes
    @data_attributes = { bs: {} }
    configure_size(options.delete(:size))
    options.each_key do |key|
      configure_data_attributes(feature: key, value: options.fetch(key)) if DATA_ATTRIBUTE_FEATURES.key?(key)
      configure_utility_classes(feature: key, value: options.fetch(key)) if UTILITY_CLASS_FEATURES.key?(key)
    end
  end

  def view_template(&block)
    div(class: @class_names.join(" "), id: @id, tabindex: -1, data: @data_attributes) do
      div(class: @dialog_classes) do
        div(class: "modal-content") do
          parts &block
        end
      end
    end
  end

  def parts(&block)
    yield
  end

  def header(&block)
    div(class: "modal-header") do
      yield if block_given?

      if @dismissible
        button(
          type: "button",
          class: "btn-close",
          data_bs_dismiss: "modal",
          aria_label: t('aria_labels.modal.close')
        )
      end
    end
  end

  def body(&block)
    div(class: "modal-body") do
      yield if block_given?
    end
  end

  def footer(&block)
    div(class: "modal-footer") do
      if block_given?
        yield
      else
        if @dismissible
          button(type: "button", class: "btn btn-secondary", data_bs_dismiss: "modal") do
            t('buttons.modal.close')
          end
        end
      end
    end
  end

  private

  def configure_data_attributes(feature:, value:)
    return unless value
    return unless DATA_ATTRIBUTE_FEATURES.key?(feature)

    @data_attributes[:bs].merge!(DATA_ATTRIBUTE_FEATURES.fetch(feature))
  end

  def configure_utility_classes(feature:, value:)
    return unless value
    return unless UTILITY_CLASS_FEATURES.key?(feature)

    feature_css_class = UTILITY_CLASS_FEATURES.fetch(feature, "")
    feature_css_class = feature_css_class.fetch(value, "") if feature_css_class.is_a?(Hash)

    @dialog_classes.append(feature_css_class)
  end

  def configure_size(size)
    return unless size
    return unless SIZES.include?(size)

    @dialog_classes.append("modal-#{size}")
  end

  def configure_fullscreen(option)
    return unless option
    return if FULL_SCREEN_OPTIONS.exclude?(option)

    @dialog_classes.append(FULL_SCREEN_OPTIONS.fetch(option))
  end

  def default_class_names
    @class_names ||= %w[modal fade]
  end

  def default_dialog_classes
    @dialog_classes ||= %w[modal-dialog]
  end
end
