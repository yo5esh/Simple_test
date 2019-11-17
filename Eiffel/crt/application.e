note
	description: "crt application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization



feature

    make

        ModInverse(a : INTEGER; m : INTEGER):INTEGER
        
        -- Defining Precondition in the Program
        -- We use require to define the precondition
        local
            x : INTEGER
            p,q : INTEGER

        do
        	p := a
        	q := m

        	p := p\\q    -- using \\ for modulo

           from x = 1 until x>=m loop

              if ((((a*x)\\m)= 1) then
                     RESULT := x
                else
                 print ("INVALID")
               end
           end
       end

      FindMinX( num[] : ARRAY; rem[] : ARRAY)
      do
      	 -- it is just a variable for handling the cases
      	 m, i , j, y : INTEGER

      	   m := 1
      	   from i = 0 until i>=k loop
      	   	 m := m*num[i] --  for Handling the case m m1*m2*m3*m4.....m(n)
      	   end

      	   reslt : INTEGER
      	   reslt := 0

      	   from j := 0  until j>=k
      	   loop
      	   	     y := m / num[j]

      	   	   reslt := reslt +  rem[j]*ModInverse( y, num[j]) * y
      	   end

      	  RESULT := reslt \\ m

      end
