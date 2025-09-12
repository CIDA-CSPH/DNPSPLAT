# Module UI function
cltFromProbDistUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(
    
    
    
    br(),
    
    
  
    
    column(12,style = " background-color: white; border-radius: 5px; ",
           br(),
           column(width=10,
                  h2("Probability Distribution")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         actionButton(ns("snip3a1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip3a2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )),
           br(),
           br(),
           br(),
           column(width=12,
                  br(),
                  "Enter a sample identifier, a mean, a standard deviation, and a sample size below. Then select a probability distribution.",
                  br(),
                  br(),
                  textInput(ns("seed"),"Enter Sample Identifier (seed)",value="12345"),
                  textInput(ns("meanPop"),"Enter Mean",value="1.1"),
                  textInput(ns("sdPop"),"Enter Standard Deviation",value="1.7"),
                  textInput(ns("NSamp"),"Enter Sample Size",value="10"),
                  selectInput(ns("dist"), "Select a Probability Distribution", choices = c("Normal", "Gamma")),
                  br(),

                  br()
           )
    ),
    
    column(12,
           br(),
           br(),
           br()
    ),
    
    
    
    column(12, style = " background-color: white; border-radius: 5px; ",
           br(),
           column(width=10,
                  h2("Probability Plots")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         actionButton(ns("snip3b1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip3b2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )),
           br(),
           br(),
           br(),
    
           
           
    column(12, style = " background-color: white; border-radius: 5px; ",
    column(6, 
           h4("Distribution of Data"),
           br(),
           plotOutput(ns("histogram2a"),height=300),
           br()#,
           #plotOutput(ns("histogram3a"),height=300),
           #br()
    ),
    #h3("Distribution of Sample Means"),
    #"The following plot is a histogram of the sample means from all of the samples you've sampled so far, with the sample mean for your current sample indicated in red. It can be used as an estimate of the probability distribution of the sample mean (in the population). Remember, the sample mean from a given sample is not random, and therefore has no probability distribution, just like the observed data values in the sample. However, it's a random variable in the population, just like any other random variable in the population, and therefore has a probability distribution in the population.The plot of observed sample means below is not a probability distribution, it's just a histogram of a bunch of observed sample mean values from your set of observed samples. However, it can be used as an estimator of the probability distribuuution of the sample mean in the population. As you sample more samples, and therefore ad observed saample means to this histogram, it will estimate the probability distribution of the sample mean better and better, and will converge to that probability distribution as you sample an infinite number of times. Increasing the number of samples is what makes the histogram below converge to the true probability distribution (called consitency of the empirical distribution function), but not what makes the distribution converge to a normal distribution. Increasing the sample size of all of your samples is what makes the distribution converge to a normal distribution (called the central limit theorem).",
    #br(),
    #br(),
    column(6, 
           h4("Sample Means"),
           br(),
           plotOutput(ns("histogram4a"),height=300),
           br(),
           #plotOutput(ns("histogram5a"),height=300),
           #br()
           
    ),
    br(),
    br(),
    br(),
    br(),
    ),
    ),

    
    
    column(12,
           br(),
           br(),
           br()
    )
  )
  
  
  
  
  
  
  
  
}








cltFromProbDistServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      datIn_a<-reactive({
        set.seed(input$seed)
        NSamp_a<-as.numeric(input$NSamp)
        meanPop_a<-as.numeric(input$meanPop)
        sdPop_a<-as.numeric(input$sdPop)
        
        if(input$dist=="Normal"){
          matrix1a_a<-rnorm(n=NSamp_a,mean=meanPop_a,sd=sdPop_a)
        }
        
        if(input$dist=="Gamma"){
          theta<-sdPop_a^2/meanPop_a
          k<-meanPop_a/theta
          matrix1a_a<-rgamma(n=NSamp_a,shape=k,scale=theta)
        }

        
        matrix1a_a
      })
      
      dat_a<-reactive({
        
        matrix1a_a<-datIn_a()
        matrix1b_a<-input$matrix1b_a
        
        #dat0<-as.matrix(matrix1In)
        dat0a_a<-as.matrix(matrix1a_a)
        dat0b_a<-as.matrix(matrix1b_a)
        
        colNames1_a<-vector(length=length(na.omit(dat0a_a)))
        colNames1_a[]<-colnames(matrix1a_a)
        #colNames1[]<-"ColName1"
        
        colNames2_a<-vector(length=length(na.omit(dat0b_a)))
        colNames2_a[]<-colnames(matrix1b_a)
        #colNames2[]<-"ColName2"
        
        matrix1a1_a<-cbind(na.omit(dat0a_a),colNames1_a)
        matrix1b1_a<-cbind(na.omit(dat0b_a),colNames2_a)
        
        matrix1_2_a<-na.omit(rbind(matrix1b1_a,matrix1a1_a))
        
        dat1_a<-data.frame("Outcome"=as.numeric(unlist(matrix1_2_a[,1])),"Group"=unlist(matrix1_2_a[,2]))
        
        dat1_a
        
      })
      
      dat1_a<-reactive({
        
        matrix1a_a<-datIn_a()
        
        dat0a_a<-as.matrix(matrix1a_a)
        
        #colNames1_a<-vector(length=length(na.omit(dat0a_a)))
        #colNames1_a[]<-colnames(matrix1a_a)
        
        matrix1a1_a<-na.omit(dat0a_a)
        
        matrix1_2_a<-na.omit(matrix1a1_a)
        
        dat1_a<-data.frame("Outcome"=as.numeric(unlist(matrix1_2_a)))
        
        dat1_a
        
      })
      
      #dat2_a<-reactive({
      #  
      #  matrix1b_a<-input$matrix1b_a
      #  
      #  dat0b_a<-as.matrix(matrix1b_a)
      #  
      #  colNames1_a<-vector(length=length(na.omit(dat0b_a)))
      #  colNames1_a[]<-colnames(matrix1b_a)
      #  
      #  matrix1b1_a<-cbind(na.omit(dat0b_a),colNames1_a)
      #  
      #  matrix1_2_a<-na.omit(matrix1b1_a)
      #  
      #  dat_a<-data.frame("Outcome"=as.numeric(unlist(matrix1_2_a[,1])),"Group"=unlist(matrix1_2_a[,2]))
      #  
      #  dat1_a
      #  
      #})
      
      bootMean1_a<-reactive({
        
        matrix1_0_a<-datIn_a()
        
        meanFunc_a<-function(dat_a,wt){
          sum(dat_a * wt)
        }
        
        bootMean_a<-boot(unlist(matrix1_0_a),meanFunc_a,R=100000, stype = "w")$t
        
        dat0_a<-as.matrix(bootMean_a)
        
        #colNames1_a<-vector(length=length(na.omit(dat0_a)))
        #colNames1_a[]<-colnames(matrix1_0_a)
        
        matrix1_1_a<-na.omit(dat0_a)
        
        matrix1_2_a<-na.omit(matrix1_1_a)
        
        dat1_a<-data.frame("Outcome"=as.numeric(unlist(matrix1_2_a)))
        
        dat1_a
      })
      
      #bootMean2<-reactive({
      #  
      #  matrix1_0<-input$matrix1b
      #  
      #  meanFunc<-function(dat,wt){
      #    sum(dat * wt)
      #  }
      #  
      #  bootMean<-boot(unlist(matrix1_0[,1]),meanFunc,R=100000, stype = "w")$t
      #  
      #  dat0<-as.matrix(bootMean)
      #  
      #  colNames1<-vector(length=length(na.omit(dat0)))
      #  colNames1[]<-colnames(matrix1_0)
      #  
      #  matrix1_1<-cbind(na.omit(dat0),colNames1)
      #  
      #  matrix1_2<-na.omit(matrix1_1)
      #  
      #  dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
      #  
      #  dat1
      #})
      
      
      matrix1a_a<-reactive({
        matrix1a_a<-datIn_a()
        matrix1a_a
      })
      
      #matrix1b<-reactive({
      #  matrix1b<-input$matrix1b
      #  matrix1b
      #})
      
      
      outcomeLabel<-reactive({
        input$outcomeLabel
      })
      
      predLabel<-reactive({
        input$predLabel
      })
      
      
      output$histogram2a<-renderPlot({
        ggplot(dat1_a(),aes(x=Outcome)) + 
          geom_histogram() #+ 
          #xlab(outcomeLabel_a()) + 
          #xlim(min(c(matrix1a_a(),matrix1b()))-0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b()))),max(c(matrix1a(),matrix1b()))+0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b())))) + 
          #ylab("Count")
        #ggplot() + geom_boxplot(aes(y=matrix1a))
      })
      
      
      output$histogram4a<-renderPlot({
        bw_a<-(max(bootMean1_a()$Outcome)-min(bootMean1_a()$Outcome))/30
        nObs_a<-sum(!is.na(bootMean1_a()$Outcome))
        ggplot(bootMean1_a(),aes(x=Outcome)) + 
          geom_histogram(
            binwidth=bw_a#,
            #aes(y=..density..)
          ) + 
          #xlab(outcomeLabel()) + 
          #xlim(min(c(matrix1a_a()))-0.1*(max(c(matrix1a_a()))-min(c(matrix1a()))),max(c(matrix1a()))+0.1*(max(c(matrix1a()))-min(c(matrix1a())))) + 
          #ylab("Count") + 
          stat_function(fun = function(x) 
            dnorm(x, mean = mean(bootMean1_a()$Outcome), sd = sd(bootMean1_a()$Outcome)) * bw_a * nObs_a,color="red")
      })
      
      
      
      
      
      
      observeEvent(
        input$snip3a1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Key Components of the Theorem"), ##### Change this one every time and text below
                               "1) Independence and Identical Distribution: The variables in question must be independent of each other and follow the same probability distribution.", br(),
                               
                               "2) Sample Size: The theorem becomes more accurate as the sample size increases. For many practical purposes, a sample size of 30 is considered sufficiently large for the CLT to apply, though the exact number can vary depending on the original distribution’s shape.", br(),
                               
                               "3) Distribution Shape: The original distribution does not need to be normal. The CLT will still apply even if the original distribution is skewed or has other irregularities.", br(),        
                               
                               br(), br() ) ) )) })
      observeEvent(
        input$snip3a2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Specifics of the Central Limit Theorem"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip3a2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      
      
      
      
      observeEvent(
        input$snip3b1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Why the CLT Matters"), ##### Change this one every time and text below
                               "1) Simplifies Analysis: The CLT allows for the approximation of probabilities and other statistical properties using the normal distribution. This is particularly useful because the normal distribution has well-known properties and is mathematically convenient.", br(),
                              "2) Facilitates Hypothesis Testing: In hypothesis testing and confidence interval estimation, the CLT justifies the use of normal distribution-based methods even when the underlying data is not normally distributed.", br(),
                              "3) Real-World Application: Many real-world phenomena, from human heights to measurement errors, involve the aggregation of multiple independent factors. The CLT helps in understanding and predicting the behavior of such aggregated data.", br(),
                              h4("Example"),
                              "Imagine you are rolling a fair six-sided die repeatedly. If you roll the die once, the outcome follows a uniform distribution (each face has an equal chance of appearing). However, if you roll the die 50 times and calculate the average of those rolls, the distribution of these averages will tend to approximate a normal distribution, regardless of the uniform distribution of individual die rolls.",

                            h4("Practical Considerations"),
                              "1) Sample Size: While the CLT holds true for large sample sizes, the definition of “large” can depend on the underlying distribution. For distributions with extreme skewness or heavy tails, larger samples may be needed.",
                                  br(),
                              "2) Finite Variance: The CLT requires that the random variables have finite variance. If this condition is not met, the theorem may not apply.",
                                br(), br(),
                              "In summary, the Central Limit Theorem is crucial because it enables the use of normal distribution techniques for analyzing sample means, making it a cornerstone of statistical inference and probability.",
                               
                               
                                 br(), br() ) ) )) })
      observeEvent(
        input$snip3b2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Specifics of the Central Limit Theorem"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip3b2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      

      
    }
  )    
}
