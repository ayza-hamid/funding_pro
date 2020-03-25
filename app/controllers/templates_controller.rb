# frozen_string_literal: true

class TemplatesController < ApplicationController
  before_action :set_template, only: %i[edit update]

  def edit; end

  def update
    updated_template = params[:template][:content]

    if @template.update!(template_params)
      File.open("app/views/assets/asset_report.html.erb", "w") { |file| file.puts CGI.unescapeHTML(updated_template).html_safe }
      redirect_to root_path
    end
  end

  private

  def set_template
    @template = Template.find(params[:id])
  end

  def template_params
    params.require(:template).permit(:name, :content)
  end
end
