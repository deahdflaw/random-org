require 'uri'
require 'net/http'

module RandomOrg
	
	class Integer
		@@url = URI.parse("http://random.org/integers/")
		ValidBases = [2, 8, 10, 16]
    ValidNums = [1...1000]
		
		attr_reader :min, :max, :base, :value, :opts, :num
		
		def initialize(min, max, base=10, num=1)
      @num = num.to_s
			@min = min.to_s
			@max = max.to_s
			@base = base.to_s
			@@url.query = "num=#{@num}&min=#{@min}&max=#{@max}&col=#{@num}&base=#{@base}&format=plain&rnd=new"
			
			begin
				res = Net::HTTP.get(@@url).chomp
				if @base.to_i != 16
          res.each { |x| x.to_i }
        end
        @value = res
			rescue Net::HTTPFatalError => e
				puts "Error: " + e
			end
		end
		
	end
end