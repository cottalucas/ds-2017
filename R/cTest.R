# implementation of t test with all necessary assumptions about the data given
# the input parameters needs to be 2 categorical independent parametric values

cTest = function(groupA, groupB) {
  # checking assumptions
  # empty list
  if (!length(groupA) || !length(groupB)) {
    print("Error: empty list")
  } else {
     # nominal variables
    if (typeof(groupA) != 'double' || typeof(groupB) != 'double') {
      print("Error: categorical variable required")
    } else {
      
      # case 1: Equal sample sizes, equal variance
      if ((var(groupA) == var(groupB)) && (length(groupA) == length(groupB))) {
        nA = length(groupA)
        nB = length(groupB)
        
        varA = var(groupA)
        varB = var(groupB)
        
        # sum of x-Mx**2/n-1 and y-My**2/n-1
        #meanA = sum((groupA - mean(groupA))**2)/(nA-1)
        #meanB = sum((groupB - mean(groupB))**2)/(nB-1)
        meanA(groupA)
        meanB(groupB)
        
        # pooled standar deviation
        sp = sqrt((varA + varB)/2)
        
        # meanA - meanB / sqrt(meanA/n + meanB/n)
        t = (meanA - meanB) / sqrt(2/n)*sp
        
        # degrees of freedom
        df = 2*nA - 2
        
        output = c(t, meanA, meanB, df)
        names(output) = c("T-Value", "Mean G1", "Mean G2", "Degrees of Freedom")
        print(output)
      }
      
      # case 2: Equal or unequal sample size, equal variance 
      if ((var(groupA) == var(groupB)) && ((length(groupA) == length(groupB)) || (length(groupA) != length(groupB)))) {
        nA = length(groupA)
        nB = length(groupB)
        
        varA = var(groupA)
        varB = var(groupB)
        
        # sum of x-Mx**2/n-1 and y-My**2/n-1
        #meanA = sum((groupA - mean(groupA))**2)/(nA-1)
        #meanB = sum((groupB - mean(groupB))**2)/(nB-1)
        meanA(groupA)
        meanB(groupb)
        
        # pooled standard deviation
        sp = sqrt(((nA-1)*varA) + (nB-1)*varB/(nA + nB - 2))
        
        # meanA - meanB / sqrt(meanA/n + meanB/n)
        t = (meanA - meanB) / sqrt(meanA/n + meanB/n) * sp
        
        # degrees of freedom
        df = nA + nB - 2
        
        output = c(t, meanA, meanB, df)
        names(output) = c("T-Value", "Mean G1", "Mean G2", "Degrees of Freedom")
        print(output)
      }
      
      # case 3: Equal or unnequal sample size, unequal variance - Welch's t-test
      if ((var(groupA) != var(groupB)) && ((length(groupA) == length(groupB)) || (length(groupA) != length(groupB)))) {
        nA = length(groupA)
        nB = length(groupB)
        
        varA = var(groupA)
        varB = var(groupB)
        
        meanA = mean(groupA)
        meanB = mean(groupB)
        
        # sum of x-Mx**2/n-1 and y-My**2/n-1
        fA = sum((groupA - meanA)**2)/(nA-1)
        fB = sum((groupB - meanB)**2)/(nB-1)
        
        # unbiased estimator
        standardError = sqrt((varA/nA) + (varB/nB))
        
        # meanA - meanB / sqrt(meanA/n + meanB/n)
        t = (meanA - meanB) / standardError
        
        # degrees of freedom
        df = ((varA/nA + varB/nB) ** 2)/ (((varA/nA) ** 2/(nA - 1)) + ((varB/nB) ** 2)/(nB - 1))
        
        
        output = c(t, meanA, meanB, df)
        names(output) = c("T-Value", "Mean G1", "Mean G2", "Degrees of Freedom")
        print(' # Welch Two Sample t-test # ')
        print(output)

      }
    }
  }
}


a = c(5,7,5,3,5,3,3,9)
b = c(8,1,4,6,6,4,1,2)
c = c(8,1,4,6,6,4,1,2)

cTest(a, b)
cTest(c, b)

t.test(a,b)
