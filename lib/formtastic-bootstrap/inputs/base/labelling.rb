module FormtasticBootstrap
  module Inputs
    module Base
      module Labelling

        include Formtastic::Inputs::Base::Labelling

        def label_html_options
          super.tap do |options|
            # Bootstrap defines class 'label' too, so remove the
            # one that gets created by Formtastic.
            options[:class] = options[:class].reject { |c| c == 'label' }
            options[:class] << " control-label"
            options[:class] << input_html_options[:label_class]
          end
        end

        # def control_label_html
        def label_html
          render_label? ? builder.label(input_name, label_text, label_html_options) : "".html_safe
        end

      end
    end
  end
end
