require 'httparty'
require 'json'

class Postcodeio
    include HTTParty #bring the module HTTParty into our class

    base_uri'https://api.postcodes.io'

    attr_accessor :single_postcode_results, :multiples_postcode_result

    def get_single_postcode(postcode)
        @single_postcode_results = self.class.get("/postcodes/#{postcode}")
        # puts @single_postcode_results
        puts JSON.parse(@single_postcode_results.body)
    end 

    def get_multiples_postcode_result(postcodes)
        @multiples_postcode_result = self.class.post("/postcodes/", body: {"postcodes":postcodes})
        puts JSON.parse(@multiples_postcode_result.body)
    end

end

single = Postcodeio.new
single.get_single_postcode('KT65DL')

postcodes_arr = ['KT6 5DL', 'TW10 6TF']
multiple = Postcodeio.new
multiple.get_multiples_postcode_result(postcodes_arr)