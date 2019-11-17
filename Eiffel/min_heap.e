note
	description: "Summary description for {MIN_HEAP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MIN_HEAP

inherit

	      ARGUMENTS_32

create


 feature



          --  local
            --   i,j,k : INTEGER
            --   N : INTEGER
           --   x,y : INTEGER
            --  array : ARRAY[INTEGER]

         -- swap


      swap(x:INTEGER; y:INTEGER)
      	local
      		temp:INTEGER
         do

     	     temp := x
     	     x := y
     	     y := temp
         end



     -- heapify feature



             heapify(array : ARRAY[INTEGER]; i : INTEGER; N : INTEGER) : INTEGER
             local

             	left : INTEGER   -- deinfe int
             	right : INTEGER   --
             		smallest : INTEGER
             do

             	left := 2*i  -- assigning the value of left and right
             	right := 2*i+1



             	 if left <= N and array[left]<array[i] then

             	 	smallest := left
             	 else
             	 	  smallest := i
             	 end

             	 if right <= N and array[right]<array[smallest] then
             	 	smallest := right
             	 end


             	 if smallest /= i  then

             	 	 swap(array[i],array[smallest])
             	 	 heapify(array,smallest,N)

             	 end
             end





      remove( array : ARRAY[INTEGER]; N : INTEGER) : INTEGER

      local
       tem : INTEGER
      do

      	 tem := array[1]
      	 array[1] := array[N]
      	 array[N] := tem
      	 heapify(array,1,N-1)
      	 result := tem
     end
   -- building heap

             build( array : ARRAY[INTEGER]; N : INTEGER) : INTEGER

               local
                   j :INTEGER
             do

                      from j := N/2
                      until j < 1
                      loop

                         j := j-1
                      	heapify(array,j,N)

                      end
             end

   -- finding the minimum value of the heap just by heap


             peak ( array : ARRAY[INTEGER]; N:INTEGER) : INTEGER

             do
             	RESULT  := array[1]

             end


end
