def resp1(response, n1, n2)

		

	case response.downcase
	when "divide"
		ntotal = resp2(n1,n2)
	 when 'add'
 		ntotal = n1.to_i + n2.to_i

 	when "multiply"
	 	puts "Enter 2 values you want to multiply"
	    ntotal = n1.to_i * n2.to_i
	    puts "Your answer is #{ntotal}"

	when "subtract"
	 	puts "Enter 2 values you want to subtract"
	    ntotal = n1.to_i - n2.to_i
	    puts "Your answer is #{ntotal}"
	end
	ntotal
end


def resp2(num1,num2)

	
	if num2.to_i == 0 
		false
	else 
		numtotal = num1.to_i / num2.to_i
		
	end
	numtotal
end

