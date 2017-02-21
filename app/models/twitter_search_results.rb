module Twitter
  class SearchResults
    def next_page
      return nil unless next_page?
      hash = query_string_to_hash(@attrs[:search_metadata][:next_results])
      since_id = @attrs[:search_metadata][:since_id]
      hash[:since_id] = since_id unless since_id.zero?
      hash
    end
  end
end


























