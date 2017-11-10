note
	description: "Summary description for {NUM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NUM
create
	make

feature
	make
		do
			create arr.make_empty
		end

feature -- Initialisation
	size , base : INTEGER_32
	arr			: ARRAY [INTEGER_32]
	overflow	: BOOLEAN

feature -- Setters

	set_size(i: INTEGER_32)
		require
			valid_size: i > 0 -- Length minimum 1
		do
			size := i
			arr.resize (1,size)
		ensure
			size_assigned : size = old i
			array_size : arr.count = old i
		end

	set_base(i: INTEGER_32)
		require
			valid_base: i > 0 -- Positive base
		do
			base := i
		ensure
			base_assigned : base = old i
		end
	set_overflow(i: BOOLEAN)
		do
			overflow := i
		end
	store_data_array(i: STRING):BOOLEAN
		local count,value,error : INTEGER_32
		do
		--	io.put_integer_32 (i.count)
		--	io.new_line
			error := 0
			from
				count := 1
			until
				count > size
			loop
			--	io.put_integer_32(count)
			--	io.put_string (": ")
				value := i[count].code
				if
					value >= 48 and value <= 57
				then
					value := value - 48
			--		io.put_integer (value)
					arr.put (value, count)
				else
					if
						value >= 65 and value <= 90
					then
						value := value - 65 + 10
			--			arr.put (value,count)
					else
						error := error + 1
					end
				end
				count := count + 1
			end
			Result := True

			if
				error > 0
			then
				Result := False
			end
		end
	print_array
		local i : INTEGER_32
		do
			from
				i := 1
			until
				i > size
			loop
			--	io.put_integer_32(i)
			--	io.put_string (": ")
				if
					arr[i] /= -1
				then
					if
						arr[i] < 10
					then
						io.put_integer_32(arr[i])
					else
						inspect arr[i]

						when 10 then io.put_string("A")
						when 11 then io.put_string("B")
						when 12 then io.put_string("C")
						when 13 then io.put_string("D")
						when 14 then io.put_string("E")
						when 15 then io.put_string("F")

						end
					end
				end
		--		io.new_line
				i := i + 1
			end
		end

end
