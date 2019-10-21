# frozen_string_literal: true

module ReportsHelper
  # creates a popup link to page link
  def report_title_column(record, _column)
    link_to(h(record.title), report_url(record), target: '_blank', rel: 'noopener')
  end

  def report_summary_column(record, _column)
    truncate(record.summary.html_safe, length: 90, escape: false) if record.summary.present?
  end

  def truncate_summary(record, length = 300)
    record.sub!(/^<p>/i, '')
    record.sub!(%r{</p>$}i, '')
    truncate(record, length: length, escape: false)

    # if r.summary.start_with?('<p>')
    #    truncate(r.summary.sub('<p>', '<p class="doc-summary">'), length: length, escape: false) + "</p>".html_safe
    #    else
    #      truncate(r.summary, length: length, escape: false)
    #    end
  end

  #   ActiveScaffold supports enabling groups in select defining :optgroup in columsn options:
  #
  #   config.columns[:column_name].options[:optgroup] = :column_to_group
  #
  #   When optgroup option is set, active_scaffold_grouped_options(column, select_options, optgroup) will be called to return options for select grouped by optgroup column.
  #
  #   As you need to group using tree structure instead of grouping by column,
  #   you could override active_scaffold_grouped_options(column, select_options, optgroup) helper method to return options as a tree. You only need to enable calling active_scaffold_grouped_options setting :optgroup to true for example:
  #
  #   config.columns[:column_name].options[:optgroup] = true

  def active_scaffold_grouped_options(_column, _select_options, _optgroup)
    new_select_options = []

    Category.roots.each do |r|
      ary = []
      found_children = false

      r.children.each do |c1|
        if c1.children.present?
          found_children = true
          c1.children.map { |child| ary << ["#{child.parent.name} -> #{child.name}", child.id] }
        else
          ary << [c1.name.to_s, c1.id]
        end
      end
      new_select_options << [r.name, ary]
    end
    new_select_options # , [@record.categories.pluck(:id)]
  end

  #   def active_scaffold_grouped_options(column, select_options, optgroup)
  #     new_select_options = []
  #     #Category.walk_tree { |cat, level|  puts "CAT #{cat.name} LEVEL #{level}" }
  #
  #     Category.roots.each do |r|
  #       new_select_options << child_array(r)
  #     end
  #     binding.pry
  #
  #     return  new_select_options #, [@record.categories.pluck(:id)]
  #   end
  #
  #
  #   def child_array(r, level=0)
  #     puts "DEPTH #{level}"
  #
  #     return r.children.map{ |c| ["#{c.parent.name} -> #{c.name}", c.id] } if level > 0 && r.children.present?
  #
  #     return [r.name, r.children.map{ |c|
  #       c.children.present?  ? child_array(c, level+1) : (level > 0) ? ["#{c.parent.name} -> #{c.name}", c.id] :  [c.name, c.id] } ]
  #
  #   end
  #
  #   # IF MULTIDIM WORKED WITH OPTGROUP
  #   #def child_array(r, level=0)
  #   #  puts "DEPTH #{level}"
  #   #  return [r.name, r.children.map{ |c|
  #   #    c.children.present? ? child_array(c, level+1)
  #   #      : level > 0 ? ["#{c.parent.name} -> #{c.name}", c.id] :  [c.name, c.id] } ]
  #   #end
  #
end
