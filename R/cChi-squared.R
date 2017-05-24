# implementation of chi-squared test 
# which checks if two or more attributes are associoated or not (independent)
#
# a chi-square test for independence compares two variables in a contingency table to see if they are related. It tests to see whether distributions of categorical variables differ from each another.
# a very small chi square test statistic means that your observed data fits your expected data extremely well. There is a relationship.
# a very large chi square test statistic means that the data does not fit very well. There isn’t a relationship.

# TODO 

cChiSquared = function(groupA) {
  # checking assumptions
  # empty list
  if (!length(groupA)) {
    print("Error: empty list")
  } else {
    # nominal variables
    if (typeof(groupA) != 'double') {
      #print("Error: categorical variable required")
    } else {
      # find expected value 
      nA = length(groupA)
      expect = obs/nA
      
      residual = (groupA - expect) ** 2
      
      component = sum(residual/expect)
      
      # degrees of freedom
      df = obs - 1 
      
      print(paste("Component: ", component))
      print(paste("Degrees of freedom: ", df))
    }
  }
}

a = c(1,2,3,4,5)
chisq.test(a)
cChiSquared(a)

