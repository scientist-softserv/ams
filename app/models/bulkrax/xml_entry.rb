# frozen_string_literal: true

require_dependency Bulkrax::Engine.root.join('app', 'models', 'bulkrax', 'xml_entry')

Bulkrax::XmlEntry.class_eval do       
  def self.read_data(path)
    if MIME::Types.type_for(path).include?('text/csv')
      CSV.read(path,
        headers: true,
        encoding: 'utf-8')
    else
      # This doesn't cope with BOM sequences:
      Nokogiri::XML(open(path)).remove_namespaces!
    end
  end

  def self.data_for_entry(data, source_id)
    collections = []
    children = []
    xpath_for_source_id = ".//*[name()='#{source_id}']"
    return {
      source_id => data.xpath(xpath_for_source_id).first.text.gsub('cpb-aacip/', 'cpb-aacip-'),
      delete: data.xpath(".//*[name()='delete']").first&.text,
      data:
        data.to_xml(
          encoding: 'UTF-8',
          save_with:
            Nokogiri::XML::Node::SaveOptions::NO_DECLARATION | Nokogiri::XML::Node::SaveOptions::NO_EMPTY_TAGS
        ).delete("\n").delete("\t").squeeze(' '), # Remove newlines, tabs, and extra whitespace
      collection: collections,
      children: children
    }
  end

  def build_metadata
    raise StandardError, 'Record not found' if record.nil?
    # raise StandardError, "Missing source identifier (#{source_identifier})" if self.raw_metadata[source_identifier].blank?
    self.parsed_metadata = {}
    self.parsed_metadata[work_identifier] = self.raw_metadata[source_identifier] # {"source"=>"0123456"} # originally source_identier
    self.raw_metadata.each do |key, value|
      # TODO mappings will be broken, also data is currently unparsed
      # Needs data broken out and add_metadata() calls instead
      self.parsed_metadata[key] = value
    end
    # xml_elements.each do |element_name|
    #   elements = record.xpath("//*[name()='#{element_name}']")
    #   binding.pry
    #   next if elements.blank?
    #   elements.each do |el|
    #     el.children.map(&:content).each do |content|
    #       add_metadata(element_name, content) if content.present?
    #     end
    #   end
    # end
    add_visibility
    add_rights_statement
    add_admin_set_id
    add_collections
    self.parsed_metadata['file'] = self.raw_metadata['file']
    add_local
    self.parsed_metadata
  end
end
