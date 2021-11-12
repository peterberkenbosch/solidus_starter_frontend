# frozen_string_literal: true

class TaxonsTreeComponent < ViewComponent::Base
  attr_reader :local_assigns

  def initialize(local_assigns = {})
    @local_assigns = local_assigns
  end

  def call
    title = local_assigns.fetch(:title, nil)
    root = local_assigns.fetch(:root, nil)
    current = local_assigns.fetch(:current, nil)
    depth = local_assigns.fetch(:depth, 1)
    base_class = local_assigns.fetch(:base_class, nil)

    taxons_list = tree(root, current, "#{base_class}__list", depth)

    if taxons_list.present?
      results = []

      results << content_tag(:h6, title, class: "#{base_class}__title") if title
      results << taxons_list

      safe_join(results.compact)
    end
  end

  private

  def tree(root_taxon, current_taxon, base_class, max_level = 1)
    return '' if max_level < 1 || root_taxon.children.empty?

    content_tag :ul, class: base_class do
      taxons = root_taxon.children.map do |taxon|
        css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'current' : nil

        content_tag :li, class: css_class do
          link_to(taxon.name, seo_url(taxon)) +
            tree(taxon, current_taxon, nil, max_level - 1)
        end
      end

      safe_join(taxons, "\n")
    end
  end

  def seo_url(taxon)
    helpers.spree.nested_taxons_path(taxon.permalink)
  end
end
