# lights --- display values for the front panel lights

   define(WAIT,call sleep$(intl(100)))

   common /light/ display
   integer display,count,nextl,count1
   integer pat1(8),pat2(16),pat3(8),pat4(8)

   data pat1 /:100001,:140003,:160007,:170017,
              :174037,:176077,:177177,:177777/
   data pat2 /:100000,:140000,:160000,:170000,
              :174000,:176000,:177000,:177400,
              :177600,:177700,:177740,:177760,
              :177770,:177774,:177776,:177777/

   data pat3 /:177777,:077776,:037774,:017770,
              :007760,:003740,:001700,:000600/
   data pat4 /:100001,:120005,:124025,:125125,
              :125725,:127765,:137775,:177777/

   repeat {
      display = 0
      WAIT
      for (count = 1; count <= 8; count += 1) {
         WAIT
         display = pat1(count)
         }
      for (count = 8; count > 0; count -= 1) {
         WAIT
         display = pat1 (count)
         }
      for (count = 16; count > 0; count -= 1) {
         WAIT
         display = :177777 - pat2 (count)
         }
      for (count = 16; count > 0; count -= 1) {
         WAIT
         display = pat2 (count)
         }
      for (count1 = 1; count1 <= 5; count1 += 1) {
         WAIT
         display = :100000
         for (count = 1; count <= 16; count += 1) {
            WAIT
            display = rs (display , 1)
            }
         }
      for (count = 1; count <= 16; count += 1) {
         WAIT
         display = pat2 (count)
         }
      for (count = 16; count > 0; count -= 1) {
         WAIT
         display = pat2 (count)
         }
      for (count = 1; count <= 8; count += 1) {
         WAIT
         display = pat1 (count)
         }
      for (count = 1; count <= 8; count += 1) {
         WAIT
         display = pat3 (count) 
         } 
      for (count = 8; count > 0; count -= 1) {
         WAIT
         display = pat3 (count)
         }
      for (count = 8; count > 0; count -= 1) {
         WAIT
         display = pat1 (count)
         } 
      for (count = 1; count <= 8; count += 1) {
         WAIT
         WAIT
         display = pat4 (count)
         }
      for (count = 1; count <= 8; count += 1) {
         WAIT
         WAIT
         display = :177777 - pat4 (count)
         }
      for (count = 16; count > 0; count -= 1) {
         WAIT
         display = :177777 - pat2 (count)
         }
      for (count = 1; count <= 16; count += 1) {
         WAIT
         display = :177777 - pat2 (count)
         }
      for (count = 1; count <= 16; count += 1) {
         WAIT
         display = pat2 (count)
         }
      for (count = 1; count <= 16; count += 1) {
         WAIT
         display = :177777 - pat2 (count)
         }
      for (count1 = 1; count1 <= 5; count1 += 1) {
         WAIT
         display = 1
         for (count = 1; count <= 16; count += 1) {
            WAIT
            display = ls (display , 1)
            }
         }
      }
   end
