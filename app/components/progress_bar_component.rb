class ProgressBarComponent < ApplicationComponent
  attr_reader :name, :label, :current_value, :max_value, :previous_value, :color, :width, :show_value

  alias_method :show_value?, :show_value

  FILL_COLOR_CLASSES = {
    black: "",
    blue: "ProgressBar-fillColor--blue",
    red: "ProgressBar-fillColor--red"
  }.freeze

  BAR_HEIGHT_CLASSES = {
    thick: "ProgressBar-fillColor--thick",
    thin: "ProgressBar-fillColor--thin"
  }.freeze

  def initialize(name:, label:, current_value:, max_value:, previous_value: nil, color: :black, width: :thick, show_value: false) # rubocop:disable Metrics/ParameterLists, Layout/LineLength
    @name = name
    @label = label
    @current_value = current_value
    @max_value = max_value
    @previous_value = previous_value
    @color = color
    @width = width
    @show_value = show_value
  end

  def bar_height_class = BAR_HEIGHT_CLASSES[width]

  def fill_color_class = FILL_COLOR_CLASSES[color]

  def end_fill_percent
    return 0 if max_value.blank?

    (current_value.to_f * 100) / max_value
  end

  def start_fill_percent
    return end_fill_percent if previous_value.blank?
    return 0 if max_value.blank?

    (previous_value.to_f * 100) / max_value
  end
end
