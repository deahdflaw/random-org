require 'net/http'

module RandomOrg
	
	class Integer
	
		ValidBases = [2, 8, 10, 16]
		ValidNums = [1...1000]
		
		attr_reader :min, :max, :base, :value, :opts, :num
		
		def initialize(min, max, base=10, num=1)
			@num = num.to_s
			@min = min.to_s
			@max = max.to_s
			@base = base.to_s
						
			begin
				res = Net::HTTP.get('www.random.org', "/integers/?num=#{@num}&min=#{@min}&max=#{@max}&col=#{@num}&base=#{@base}&format=plain&rnd=new").chomp
				res = res.split
					if @base.to_i != 16
						res.each { |x| x.to_i }
					end
				@value = res
			rescue Net::HTTPFatalError => e
				puts "Error: " + e
			end
		end
		
	end
	
	class String
	
		def ret(bool)
			if bool
				return "on"
			else
				return "off"
			end
		end
		
		ValidNums = [1...1000]
		ValidLens = [1...1000]
		
		attr_reader :len, :num, :dig, :upper, :lower, :uniq, :value
		
		def initialize(len, num=1, dig=true, upper=true, lower=true, uniq=false)
			@len = len.to_s
			@num = num.to_s
			@dig = ret(dig)
			@upper = ret(upper)
			@lower = ret(lower)
			@uniq = ret(uniq)
			
			begin
				res = Net::HTTP.get('www.random.org', "/strings/?num=#{@num}&len=#{@len}&digits=#{@dig}&upperalpha=#{@upper}&loweralpha=#{@lower}&unique=#{@uniq}&format=plain&rnd=new").chomp
				@value = res.split
			rescue Net::HTTPFatalError => e
				puts "Error: " + e
			end
		end
		
	end
	
	class Sequence
		
		attr_reader :min, :max, :value
		
		def initialize(min=1, max=100)
			@min = min.to_i
			@max = max.to_i
			begin
				res = Net::HTTP.get('www.random.org', "/sequences/?min=#{@min}&max=#{@max}&col=1&format=plain&rnd=new").chomp
				@value = res.split
			rescue Net::HTTPFatalError => e
				puts "Error: " + e
			end
		end
		
	end
	
	class Quota
		
		attr_reader :value
		
		def initialize()
			begin
				@value = res = Net::HTTP.get('www.random.org', "/quota/?format=plain").chomp
			rescue Net::HTTPFatalError => e
				puts "Error: " + e
			end
		end
	end
end