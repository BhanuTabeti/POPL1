note
	description: "Assignment application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
	local
		T,a,b,base10 : INTEGER_32  -- Variable for Number of Test Cases , base a ,base b
		i,j : INTEGER_32 	-- Variable for counter
		valid : INTEGER_32	-- Variable for validity check
		target_base : NUM
		do
			create given_base.make
	--		create target_base.make
			io.read_integer_32
			T := io.last_integer_32
						 -- Reading T Value from User

			from
				i := 0
			until
				i >= T
			loop
				valid := 0
			--  Reading base values
				io.read_word
				a := io.laststring.to_integer_32

				io.read_word
				b := io.laststring.to_integer_32

			--	Validating Base
				if
					test_base(a).negated or test_base(b).negated
				then
					valid := valid + 1
				end

			-- 	Storing base in object
				given_base.set_base (a)

			--	Reading the size
				io.read_integer_32
				given_base.set_size(io.last_integer_32)

				test_size(given_base)
				if
					given_base.overflow
				then
					valid := valid + 1
				end

			-- 	Reading the base a number
				io.read_stream (given_base.size)
			--	io.new_line
				if
					given_base.store_data_array (io.last_string).negated
				then
					valid := valid + 1
				end
		--		io.put_string ("hi")

			-- 	Processing Number
				if
					valid /= 0
				then
				-- 	if found invalid till this moment
					io.put_string ("INVALID")
			--		io.new_line
				else
				-- 	if every thing is fine till now
					base10 := to_base10(given_base)
					io.put_integer_32 (base10)
					io.new_line
					target_base := to_baseb(base10,b)
					if
						target_base.overflow
					then
						io.put_string ("INVALID")
					else
						target_base.print_array
					end
				end
				io.new_line
				i := i + 1
				given_base.arr.make_empty
			end
			io.new_line
		end
feature
	given_base : NUM

feature --Validity Check
	test_base(i : INTEGER_32):BOOLEAN
		require
			valid_base : i > 0
		do
			if
				i >= 1 and i <= 16
			then
				Result := TRUE
			else
				Result := FALSE
			end
		end
	test_size(i : NUM)
		do
			if
				i.size > 15
			then
				i.set_overflow(TRUE)
			else
				i.set_overflow(FALSE)
			end
		end

feature
	to_base10(obj : NUM):INTEGER_32
		local i,j,ans: INTEGER_32
		do
			ans := 0
			j := 0
			from
				i := obj.size
			until
				i < 1
			loop
				ans := ans + (obj.arr[i]*power(obj.base,j))
				i := i - 1
				j := j + 1
			end
			Result := ans
		end

	power(base:INTEGER_32;i : INTEGER_32):INTEGER_32
		require
			valid_base : base > 0
			valid_pow  : i 	  >= 0
		local j : INTEGER_32
		do
			Result := 1
			from
				j := 1
			until
				j > i
			loop
				 Result := Result * base
				 j := j +1
			end
		end
	to_baseb(num:INTEGER_32;base:INTEGER_32):NUM
		require
			valid_num : num >= 0
			valid_base: base > 0

		local obj : NUM count,i,j : INTEGER_32
		do
			create obj.make
			obj.set_base (base)
			obj.set_size (15)
			i := num
			from
				j := 15
			until
				j < 1
			loop
				if
					i > 0
				then
					obj.arr[j] := i\\base
					i := i//base
				else
					obj.arr[j] := -1
				end
				j := j - 1
				count := 1 + 1
			end
			obj.set_overflow(False)
			if
				i > base
			then
				obj.set_overflow(True)
			end
			Result := obj
		end

end
