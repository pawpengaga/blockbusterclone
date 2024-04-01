require "uri"
require "net/http"
require "json"

class Api
    attr_accessor :url, :result
    def initialize(url)
      @url = url
      @result = {}
      httpRequest() #Linea opcional
    end

    def httpRequest
        urlNew = URI(@url)
        https = Net::HTTP.new(urlNew.host, urlNew.port)

        if urlNew.scheme == "https"
            https.use_ssl = true
            https.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end

        request = Net::HTTP::Get.new(urlNew)
        response = https.request(request)
        @result = JSON.parse(response.body)
        return @result
    end

    def showData
        httpRequest() if @result.empty?
    end
end