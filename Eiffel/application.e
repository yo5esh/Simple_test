note
	description: "heapsort application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

        make

        local

            i,j: INTEGER
             N : INTEGER     -- NUMBER OF ELEMENTS IN THE ARRAY THAT HAS TO BE SHORTED
            bool : BOOLEAN -- FALG
            sort : ARRAY [INTEGER]
            array : ARRAY[INTEGER]
          --  array : ARRAY[INTEGER] -- defining the array value
           -- sort : ARRAY[INTEGER]    -- TAKING INPUT ARRAY  OF SIZE n , Sorted array

			-- Run application.


		do

			create p
			--| Add your code here

			  Io.read_integer   -- reading an integer in eiffel
			  n:= Io.last_integer  -- storing the value in n
			  Io.read_integer  -- reading the value of an array
			  array := Io.last_integer  -- storing the value of an array

                 Io.put_string("hello")
        --    require -- precondition

                   bool := true

                  -- bool is a precondition defined for n>0
                  -- if it is true then it will run the loop otherwise we have to exit the loop

			  if bool=true then

                     sort := p.heapsort(array,n)
                     print ("Sorted array is " + sort.out)
              else
                    Io.put_string ( "INVALID")
               end
                  rescue
                      Io.put_string ("INVALID")
               end


                heapsort(array : ARRAY[INTEGER];N: INTEGER):INTEGER  -- heap_sort
                local
                 heap_size:INTEGER
                 i : INTEGER
                 temp : ARRAY[INTEGER]

                do

                    temp := array
                	heap_size := N

                	p.build(temp,N)

                	from i := N until i >=2 loop

                		p.swap(temp[1], temp[i])
                		heap_size := heap_size-1
                		p.heapify(temp,1,heap_size-1)

                	end
                end
feature


     p : MIN_HEAP
end
