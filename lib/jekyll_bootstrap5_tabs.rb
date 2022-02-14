require 'slim'

DEFAULT_TEMPLATE = 'template.slim'

require_relative "jekyll_bootstrap5_tabs/version"

module JekyllBootstrap5Tabs
  # Handles the outer {% tabs %}{% endtabs %} Liquid block for Bootstrap 5
  class TabsBlock < Liquid::Block
    def initialize(tag, args, _)
      super

      raise SyntaxError.new("#{tag} requires name") if args.empty?

      @tab_name = args.strip
    end

    def template_path(template_name)
      dir = File.dirname(__FILE__)
      File.join(dir, template_name.to_s)
    end

    def render(context)
      @environment = context.environments.first
      super

      template_file_path = template_path(DEFAULT_TEMPLATE)
      template = Slim::Template.new(template_file_path)
      template.render(self)
    end
  end

  # Handles the inner {% tab %}{% endtab %} Liquid block for Bootstrap 5
  class TabBlock < Liquid::Block
    def initialize(tag, args, _)
      super

      @tabs_group, @tab = split_params(args.strip)
      raise SyntaxError.new("Block #{tag} requires tabs name") if @tabs_group.empty? || @tab.empty?
    end

    def render(context)
      environment = context.environments.first
      environment["tabs-#{@tabs_group}"] ||= {}
      environment["tabs-#{@tabs_group}"][@tab] = content
    end

    private

    def split_params(params)
      params.split('#')
    end
  end
end

Liquid::Template.register_tag('tabs', JekyllBootstrap5Tabs::TabsBlock)
Liquid::Template.register_tag('tab', JekyllBootstrap5Tabs::TabBlock)